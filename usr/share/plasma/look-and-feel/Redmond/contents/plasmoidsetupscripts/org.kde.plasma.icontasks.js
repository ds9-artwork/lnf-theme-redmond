applet.currentConfigGroup = ["General"]
applet.writeConfig("launchers" ,"file:///usr/share/applications/org.kde.dolphin.desktop?wmClass=Dolphin,file:///usr/share/applications/firefox.desktop")
applet.writeConfig("showOnlyCurrentDesktop", true)
applet.writeConfig("groupPopups", true)
applet.writeConfig("sortingStrategy", 1)
applet.reloadConfig()
