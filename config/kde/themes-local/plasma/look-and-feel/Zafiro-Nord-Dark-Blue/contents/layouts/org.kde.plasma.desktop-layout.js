/*******Panel Top*********/
paneltop = new Panel
paneltop.hiding = "none"
paneltop.location = "top"
paneltop.height = 24
paneltop.offset = 0
paneltop.addWidget("org.kde.plasma.marginsseparator")

MenuPanel = paneltop.addWidget("OnzeMenu")
MenuPanel.currentConfigGroup = ["General"]
MenuPanel.writeConfig("customButtonImage", userDataPath()+"/.local/share/plasma/look-and-feel/Zafiro-Nord-V2/contents/icons/start.svg")
MenuPanel.writeConfig("numberColumns", "4")
MenuPanel.writeConfig("useCustomButtonImage", "true")
MenuPanel.writeConfig("displayPosition", "Default")
paneltop.addWidget("org.kde.plasma.appmenu")
paneltop.addWidget("org.kde.plasma.panelspacer")

var systraprev = paneltop.addWidget("org.kde.plasma.systemtray")
var SystrayContainmentId = systraprev.readConfig("SystrayContainmentId")
const systray = desktopById(SystrayContainmentId)
systray.currentConfigGroup = ["General"]
systray.writeConfig("iconSpacing", 6)

paneltop_clock = paneltop.addWidget("com.marcinorlowski.htmlclock")
paneltop_clock.currentConfigGroup = ["Appearance"]
paneltop_clock.writeConfig("useUserLayout", "true")
paneltop_clock.currentConfigGroup = ["Configuration/Appearance"]
paneltop_clock.writeConfig("layout", '<html><body><center><span style="font-weight:500;">{DD:u} {d} | {h}:{ii}</span></center></body></html>')
paneltop.addWidget("org.kde.milou")
paneltop.addWidget("org.kde.plasma.marginsseparator")
            /****************************/
let allDesktops = desktops()
const width = screenGeometry(allDesktops).width
panelbottom = new Panel
panelbottom.location = "bottom"
panelbottom.height = 66
panelbottom.offset = 0
panelbottom.alignment = "center"
panelbottom.panelVisibility = "2"
for (a = 1; a < width+1; a++){
}
panelbottom.maximumLength = Number(a)
panelbottom.minimumLength = 100
panelbottom.hiding = "windowscover"
panelbottom.addWidget("org.kde.plasma.marginsseparator")
panelbottom.addWidget("org.kde.plasma.icontasks")
panelbottom.addWidget("org.kde.plasma.marginsseparator")

let IDPanel = "Panel"+" "+panelbottom.id
/*cambiando config*/
const config = ConfigFile('plasmashellrc')
config.group = 'PlasmaViews'
const config2 = ConfigFile(config, IDPanel)
config2.writeEntry('floating', 1)
panelbottom.reloadConfig()

let desktopsArray = desktopsForActivity(currentActivity());
for( var j = 0; j < desktopsArray.length; j++) {
var desktopByClock = desktopsArray[j]
}
const NumX = Number((screenGeometry(desktopByClock).width)-340)
const NumY = Number((screenGeometry(desktopByClock).height)-294)
var analogclock = desktopByClock.addWidget("com.github.prayag2.minimalistclock", NumX, NumY)

/* accent color config*/
ColorAccetFile = ConfigFile("kdeglobals")
ColorAccetFile.group = "General"
ColorAccetFile.writeEntry("accentColorFromWallpaper", "false")
ColorAccetFile.deleteEntry("AccentColor")
ColorAccetFile.deleteEntry("LastUsedCustomAccentColor")
plasma.loadSerializedLayout(layout);
