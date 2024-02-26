qdbus org.kde.plasmashell /PlasmaShell evaluateScript 'const NumDePanels = (panels().length)
let NuIdCo = "";
for (a = 0; a < NumDePanels; a++){
    let widge = panelById(panelIds[a]).widgets(["com.github.scriptinator"])
    if (widge.length === 1){
        NuIdCo += a;}
}
var PanelIdentificado = panelById(panelIds[NuIdCo])
let ListIdsWidgets = PanelIdentificado.widgetIds
for (b = 0; b < ListIdsWidgets[ListIdsWidgets.length-1]; b++){
    var WidgetInFind = PanelIdentificado.widgetById(b)
    if (WidgetInFind){
        if (WidgetInFind.type === "com.github.scriptinator") {}
}
}
var WidFnl = PanelIdentificado.widgetById(b)
WidFnl.remove()
WidFnl.remove()
'
