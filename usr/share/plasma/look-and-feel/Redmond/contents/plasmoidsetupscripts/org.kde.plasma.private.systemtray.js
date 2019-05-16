applet.currentConfigGroup = ["General"]
applet.writeConfig("extraItems","org.kde.plasma.devicenotifier,org.kde.plasma.networkmanagement,org.kde.plasma.diskquota,org.kde.plasma.bluetooth,org.kde.plasma.clipboard,org.kde.plasma.printmanager,org.kde.plasma.battery,org.kde.plasma.volume")
applet.writeConfig("knownItems", "org.kde.plasma.volume,org.kde.plasma.networkmanagement,org.kde.plasma.bluetooth,org.kde.plasma.battery,org.kde.discovernotifier,org.kde.plasma.clipboard,org.kde.plasma.mediacontroller,org.kde.plasma.devicenotifier,org.kde.plasma.notifications,org.kde.plasma.printmanager,org.kde.plasma.notifications,org.kde.kdeconnect")
applet.reloadConfig()
