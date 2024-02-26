import QtQuick 2.15
import QtQuick.Layouts 1.15
import org.kde.plasma.core 2.0 as PlasmaCore
import org.kde.plasma.plasmoid 2.0
import org.kde.plasma.private.pager 2.0
import "./utils.js" as Utils

Item {
    id: root

    anchors.fill: parent
    Layout.minimumWidth: plasmoidWidth
    Layout.preferredWidth: plasmoidWidth
    Layout.minimumHeight: plasmoidHeight
    Layout.preferredHeight: plasmoidHeight

    Plasmoid.preferredRepresentation: Plasmoid.fullRepresentation
    Plasmoid.constraintHints: PlasmaCore.Types.CanFillArea

    readonly property bool vertical: plasmoid.formFactor === PlasmaCore.Types.Vertical
    readonly property int panelThickness: Utils.getThickness(parent, vertical)
    readonly property int plasmoidWidth: vertical ? panelThickness : thickness
    readonly property int plasmoidHeight: vertical ? thickness : panelThickness

    readonly property int thickness: 4
    readonly property color pageBgColor: Utils.colorAlpha(PlasmaCore.ColorScope.textColor, 0.2)
    readonly property color pageBgColorEmpty: "transparent"
    readonly property color pageBgColorCurrent: PlasmaCore.ColorScope.highlightColor

    ColumnLayout {
        id: pagesContainer

        width: thickness
        height: panelThickness
        rotation: vertical ? -90 : 0
        transform: Translate {y: vertical ? thickness : 0}
        transformOrigin: Item.TopLeft

        spacing: 1

        Repeater {
            model: pagerModel

            Rectangle {
                id: pageItem

                width: thickness
                Layout.fillHeight: true

                color: current ? pageBgColorCurrent :
                    hasWindows ? pageBgColor :
                    pageBgColorEmpty

                readonly property bool current: index === pagerModel.currentPage
                property bool hasWindows: Utils.hasWindows(model)

                Connections {
                    target: model.TasksModel
                    function onRowsInserted() {
                        Utils.updatePageState(model, pageItem);
                    }
                    function onRowsRemoved() {
                        Utils.updatePageState(model, pageItem);
                    }
                }
            }
        }
    }

    PagerModel {
        id: pagerModel

        enabled: root.visible

        showDesktop: false

        showOnlyCurrentScreen: false
        screenGeometry: Plasmoid.screenGeometry

        pagerType: PagerModel.VirtualDesktops
    }
}
