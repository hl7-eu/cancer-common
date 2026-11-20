#!/usr/bin/env python3
"""Generate input/images/FHIR-Mapping.svg (and .png via rsvg-convert) from the
FHIR profiles of this IG.

The diagram shows one box per ECCDM FHIR profile, its reference elements with
their target profiles, its remaining constrained elements, and an arrow for
every reference between profiles. All content is read from the generated
StructureDefinitions, so the picture never drifts from the profiles.

Usage (from the repo root, after `sushi .`):
    python3 input/images-source/fhir-mapping-diagram.py
    rsvg-convert -w 2640 input/images/FHIR-Mapping.svg -o input/images/FHIR-Mapping.png
"""
import glob
import json
import os
import re
import sys

ROOT = os.path.abspath(os.path.join(os.path.dirname(__file__), '..', '..'))
RES = os.path.join(ROOT, 'fsh-generated', 'resources')
OUT = os.path.join(ROOT, 'input', 'images', 'FHIR-Mapping.svg')

# Layout: column -> ordered profile ids. Everything else is derived.
COLUMNS = [
    ['procedure-surgery-eu-ccm', 'procedure-radiotherapy-eu-ccm',
     'procedure-systemic-treatment-eu-ccm', 'episode-of-care-surveillance-eu-ccm'],
    ['patient-eu-ccm', 'cancer-condition-at-diagnosis-eu-ccm',
     'observation-clinical-cancer-progression-eu-ccm'],
    ['observation-cancer-stage-eu-ccm', 'observation-treatment-response-eu-ccm',
     'observation-histology-behaviour-eu-ccm', 'observation-comorbidity-eu-ccm',
     'observation-follow-up-eu-ccm', 'observation-imaging-eu-ccm'],
]
COLORS = {  # by base resource type
    'Patient': '#2f6fb3', 'Condition': '#b5473f', 'EpisodeOfCare': '#2e7d4f',
    'Observation': '#5b4fb5', 'Procedure': '#a86a12',
}
SHORT = {  # short labels for target profiles
    'patient-eu-ccm': 'Patient', 'cancer-condition-at-diagnosis-eu-ccm': 'Condition',
    'observation-clinical-cancer-progression-eu-ccm': 'Obs',
    'observation-histology-behaviour-eu-ccm': 'Obs',
    'observation-imaging-eu-ccm': 'Obs', 'procedure-surgery-eu-ccm': 'Proc',
}
BOX_W, COL_GAP, MARGIN, TOP = 330, 170, 44, 90
ROW_H, HEAD_H, PAD, FURTHER_LINE = 23, 54, 10, 15
FONT = "Helvetica, Arial, sans-serif"
MONO = "Menlo, 'DejaVu Sans Mono', monospace"


def load():
    sds = {}
    for f in glob.glob(os.path.join(RES, 'StructureDefinition-*.json')):
        d = json.load(open(f))
        sds[d['id']] = d
    return sds


def ref_targets(types, sds):
    """Profile ids referenced by an element type list (Reference or Extension)."""
    out = []
    for t in types:
        if t.get('code') == 'Reference':
            out += [p.split('/')[-1] for p in t.get('targetProfile', [])]
        if t.get('code') == 'Extension':
            for p in t.get('profile', []):
                ext = sds.get(p.split('/')[-1])
                if ext:
                    for e in ext['differential']['element']:
                        if e['path'].startswith('Extension.value'):
                            out += ref_targets(e.get('type', []), sds)
    return out


def profile_boxes(sds):
    boxes = {}
    for col in COLUMNS:
        for pid in col:
            d = sds[pid]
            refs, further = [], []
            for e in d['differential']['element']:
                p = e['path']
                if p == d['type'] or p.startswith(d['type'] + '.extension.'):
                    continue
                name = p.split('.', 1)[1] if '.' in p else p
                if e.get('sliceName'):
                    name = f"{name}[{e['sliceName']}]"
                if name in ('extension',) or e.get('max') == '0':
                    continue
                targets = [t for t in ref_targets(e.get('type', []), sds) if t in sds]
                if targets:
                    refs.append((name, targets))
                elif name not in further and not any(name.startswith(r[0] + '.') for r in refs):
                    further.append(name)
            further = [n for n in further if not any(r[0].startswith(n + '[') or r[0].startswith(n + '.') for r in refs)]
            title = re.sub(r'\s*\(CCM\)$', '', d.get('title', d['name']))
            title = title.replace('Observation: ', '').replace('Observation ', '') \
                         .replace('Procedure ', '').replace('Episode of Care ', '')
            boxes[pid] = dict(id=pid, type=d['type'], title=title, refs=refs, further=further)
    return boxes


def wrap(items, width_chars=52):
    lines, cur = [], ''
    for it in items:
        piece = it if not cur else f' · {it}'
        if len(cur) + len(piece) > width_chars and cur:
            lines.append(cur)
            cur = it
        else:
            cur += piece
    if cur:
        lines.append(cur)
    return lines


def layout(boxes):
    x = MARGIN
    for col in COLUMNS:
        y = TOP
        for pid in col:
            b = boxes[pid]
            b['further_lines'] = wrap(b['further'])
            h = HEAD_H + ROW_H * len(b['refs']) + (
                PAD + 14 + FURTHER_LINE * len(b['further_lines']) if b['further_lines'] else 0) + PAD
            b.update(x=x, y=y, w=BOX_W, h=h)
            y += h + 30
        x += BOX_W + COL_GAP
    width = x - COL_GAP + MARGIN + 24
    height = max(b['y'] + b['h'] for b in boxes.values()) + MARGIN
    return width, height


def esc(s):
    return s.replace('&', '&amp;').replace('<', '&lt;').replace('>', '&gt;')


def draw_box(b, incoming):
    c = COLORS[b['type']]
    o = [f'<g>',
         f'<rect x="{b["x"]}" y="{b["y"]}" width="{b["w"]}" height="{b["h"]}" rx="3" fill="#ffffff" stroke="#d8d4cc"/>',
         f'<rect x="{b["x"]}" y="{b["y"]}" width="{b["w"]}" height="3" fill="{c}"/>',
         f'<text x="{b["x"]+14}" y="{b["y"]+20}" font-family="{MONO}" font-size="9" letter-spacing="1" fill="{c}">{b["type"].upper()}</text>',
         f'<text x="{b["x"]+14}" y="{b["y"]+40}" font-family="{FONT}" font-size="15" font-weight="600" fill="#222">{esc(b["title"])}</text>']
    if incoming:
        o.append(f'<text x="{b["x"]+b["w"]-14}" y="{b["y"]+20}" text-anchor="end" font-family="{FONT}" font-size="9" fill="#777">referenced by {incoming}</text>')
    y = b['y'] + HEAD_H
    for name, targets in b['refs']:
        o.append(f'<line x1="{b["x"]}" y1="{y}" x2="{b["x"]+b["w"]}" y2="{y}" stroke="#eeebe5"/>')
        o.append(f'<text x="{b["x"]+14}" y="{y+16}" font-family="{MONO}" font-size="11" fill="#222">{esc(name)}</text>')
        label = ', '.join(dict.fromkeys(SHORT.get(t, t) for t in targets))
        o.append(f'<text x="{b["x"]+b["w"]-14}" y="{y+16}" text-anchor="end" font-family="{MONO}" font-size="10" fill="#888">{esc(label)}</text>')
        y += ROW_H
    if b['further_lines']:
        o.append(f'<line x1="{b["x"]}" y1="{y}" x2="{b["x"]+b["w"]}" y2="{y}" stroke="#eeebe5"/>')
        o.append(f'<text x="{b["x"]+14}" y="{y+PAD+6}" font-family="{MONO}" font-size="8" letter-spacing="1" fill="#999">FURTHER ELEMENTS</text>')
        yy = y + PAD + 6
        for ln in b['further_lines']:
            yy += FURTHER_LINE
            o.append(f'<text x="{b["x"]+14}" y="{yy}" font-family="{MONO}" font-size="9.5" fill="#555">{esc(ln)}</text>')
    o.append('</g>')
    return '\n'.join(o)


def col_of(pid):
    return next(i for i, c in enumerate(COLUMNS) if pid in c)


def draw_edges(boxes):
    """Orthogonal connectors; every edge gets its own lane so lines never overlap."""
    edges = []
    for b in boxes.values():
        for i, (name, targets) in enumerate(b['refs']):
            for t in dict.fromkeys(targets):
                edges.append((b['id'], t, b['y'] + HEAD_H + ROW_H * i + ROW_H / 2))
    # attachment points on targets, spread over the header
    incoming = {}
    for s, t, _ in edges:
        incoming.setdefault(t, []).append(s)
    att = {}
    for t, srcs in incoming.items():
        n = len(srcs)
        for k, s in enumerate(srcs):
            att[(s, t)] = boxes[t]['y'] + 12 + (boxes[t]['h'] - 24) * (k + 1) / (n + 1)
    gutters = {}  # (col_left_index) -> lane counter
    top_lanes = 0
    out = []
    lane_gap = 12
    for s, t, sy in edges:
        S, T = boxes[s], boxes[t]
        cs, ct = col_of(s), col_of(t)
        color = COLORS[S['type']]
        ty = att[(s, t)]
        if cs == ct and abs(COLUMNS[cs].index(s) - COLUMNS[cs].index(t)) == 1:
            # vertical, between adjacent boxes in the same column
            x = S['x'] + 40 + 18 * gutters.get(('v', cs), 0)
            gutters[('v', cs)] = gutters.get(('v', cs), 0) + 1
            if T['y'] < S['y']:
                pts = [(x, S['y']), (x, T['y'] + T['h'])]
            else:
                pts = [(x, S['y'] + S['h']), (x, T['y'])]
        elif cs == ct:
            # non-adjacent boxes in the same column: route outside the column
            k = gutters.get(('o', cs), 0)
            gutters[('o', cs)] = k + 1
            if cs == len(COLUMNS) - 1:
                ox = S['x'] + S['w'] + 16 + k * lane_gap
                pts = [(S['x'] + S['w'], sy), (ox, sy), (ox, ty), (T['x'] + T['w'], ty)]
            else:
                ox = S['x'] - 16 - k * lane_gap
                pts = [(S['x'], sy), (ox, sy), (ox, ty), (T['x'], ty)]
        elif abs(cs - ct) == 1:
            g = min(cs, ct)
            k = gutters.get(g, 0)
            gutters[g] = k + 1
            gx = MARGIN + (g + 1) * BOX_W + g * COL_GAP + 20 + k * lane_gap
            sx = S['x'] + S['w'] if cs < ct else S['x']
            tx = T['x'] if cs < ct else T['x'] + T['w']
            pts = [(sx, sy), (gx, sy), (gx, ty), (tx, ty)]
        else:
            # across the whole diagram: go over the top
            top_lanes += 1
            yl = TOP - 20 - top_lanes * lane_gap
            g1 = gutters.get(min(cs, ct), 0); gutters[min(cs, ct)] = g1 + 1
            g2 = gutters.get(max(cs, ct) - 1, 0); gutters[max(cs, ct) - 1] = g2 + 1
            gxa = MARGIN + (min(cs, ct) + 1) * BOX_W + min(cs, ct) * COL_GAP + 20 + g1 * lane_gap
            gxb = MARGIN + max(cs, ct) * BOX_W + (max(cs, ct) - 1) * COL_GAP + 20 + g2 * lane_gap
            if cs > ct:
                pts = [(S['x'], sy), (gxb, sy), (gxb, yl), (gxa, yl), (gxa, ty), (T['x'] + T['w'], ty)]
            else:
                pts = [(S['x'] + S['w'], sy), (gxa, sy), (gxa, yl), (gxb, yl), (gxb, ty), (T['x'], ty)]
        d = 'M ' + ' L '.join(f'{x:.1f} {y:.1f}' for x, y in pts)
        out.append(f'<path d="{d}" fill="none" stroke="{color}" stroke-width="1.3" marker-end="url(#arrow)"/>')
    return out, {t: len(v) for t, v in incoming.items()}


def main():
    sds = load()
    if not sds:
        sys.exit(f'no StructureDefinitions in {RES}; run `sushi .` first')
    boxes = profile_boxes(sds)
    width, height = layout(boxes)
    edges, incoming = draw_edges(boxes)
    legend = []
    lx = MARGIN
    for typ, c in COLORS.items():
        legend.append(f'<circle cx="{lx+5}" cy="{TOP-56}" r="4" fill="{c}"/>'
                      f'<text x="{lx+14}" y="{TOP-52}" font-family="{MONO}" font-size="10" fill="#444">{typ}</text>')
        lx += 24 + 6.5 * len(typ)
    svg = [f'<svg xmlns="http://www.w3.org/2000/svg" width="{width}" height="{height}" viewBox="0 0 {width} {height}">',
           '<defs><marker id="arrow" viewBox="0 0 10 10" refX="9" refY="5" markerWidth="7" markerHeight="7" orient="auto-start-reverse">'
           '<path d="M 0 0 L 10 5 L 0 10 z" fill="#555"/></marker></defs>',
           f'<rect width="{width}" height="{height}" fill="#f7f6f2"/>',
           f'<text x="{MARGIN}" y="{TOP-78}" font-family="{FONT}" font-size="12" fill="#666">ECCDM logical models mapped to FHIR profiles (informative) — arrows are references between profiles</text>',
           *legend, *edges]
    for b in boxes.values():
        svg.append(draw_box(b, incoming.get(b['id'], 0)))
    svg.append('</svg>')
    open(OUT, 'w').write('\n'.join(svg))
    print(f'wrote {OUT} ({len(boxes)} boxes, {len(edges)} edges, {width}x{height})')


if __name__ == '__main__':
    main()
