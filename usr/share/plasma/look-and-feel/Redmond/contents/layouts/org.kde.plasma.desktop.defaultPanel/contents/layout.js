var panel = new Panel
var panelScreen = panel.screen
var freeEdges = {"bottom": true, "top": true, "left": true, "right": true}

for (i = 0; i < panelIds.length; ++i) {
    var tmpPanel = panelById(panelIds[i])
    if (tmpPanel.screen == panelScreen) {
        // Ignore the new panel
        if (tmpPanel.id != panel.id) {
            freeEdges[tmpPanel.location] = false;
        }
    }
}

if (freeEdges["bottom"] == true) {
    panel.location = "bottom";
} else if (freeEdges["top"] == true) {
    panel.location = "top";
} else if (freeEdges["left"] == true) {
    panel.location = "left";
} else if (freeEdges["right"] == true) {
    panel.location = "right";
} else {
    // There is no free edge, so leave the default value
    panel.location = "top";
}

panel.height = 2.5 * gridUnit

panel.addWidget("com.github.zren.tiledmenu")

panel.addWidget("com.github.notmart.inpanelkrunner")

panel.addWidget("org.kde.plasma.icontasks")


panel.addWidget("org.kde.plasma.systemtray")
panel.addWidget("org.kde.plasma.notifications")
panel.addWidget("org.kde.plasma.digitalclock")

panel.addWidget("org.kde.plasma.minimizeall")
