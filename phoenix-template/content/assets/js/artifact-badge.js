(function () {
    var path = window.location.pathname;

    if (!/\/artifacts\.html$/.test(path)) {
        return;
    }

    var headings = document.querySelectorAll("h2, h3, h4");
    for (var i = 0; i < headings.length; i++) {
        var heading = headings[i];
        if (heading.textContent.trim() !== "Structures: Resource Profiles") {
            continue;
        }
        if (heading.querySelector(".artifact-informative-badge")) {
            return;
        }

        var badge = document.createElement("span");
        badge.className = "artifact-informative-badge";
        badge.textContent = "Informative";
        badge.title = "These generated profiles are provided as informative implementation-oriented artefacts in this publication.";
        heading.appendChild(badge);

        var note = document.createElement("div");
        note.className = "artifact-informative-note";
        note.innerHTML = "<strong>Future implementation content</strong> These generated resource profiles are provided as informative implementation-oriented artefacts in this publication and are expected to evolve in subsequent iterations of this guide.";
        heading.parentNode.insertBefore(note, heading.nextSibling);
        return;
    }
})();