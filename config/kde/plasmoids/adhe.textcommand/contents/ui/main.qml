/*
 * Copyright 2013  Heena Mahour <heena393@gmail.com>
 * Copyright 2013 Sebastian Kügler <sebas@kde.org>
 *
 * This program is free software; you can redistribute it and/or
 * modify it under the terms of the GNU General Public License as
 * published by the Free Software Foundation; either version 2 of
 * the License, or (at your option) any later version.
 *
 * This program is distributed in the hope that it will be useful,
 * but WITHOUT ANY WARRANTY; without even the implied warranty of
 * MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the
 * GNU General Public License for more details.
 *
 * You should have received a copy of the GNU General Public License
 * along with this program.  If not, see <http://www.gnu.org/licenses/>.
 */
import QtQuick 2.6

import QtQuick.Controls 2.0

import QtQuick.Layouts 1.1
import org.kde.plasma.plasmoid 2.0
import org.kde.plasma.core 2.0 as PlasmaCore
import org.kde.plasma.components 2.0 as PlasmaComponents
import org.kde.plasma.extras 2.0 as PlasmaExtras
import org.kde.kquickcontrolsaddons 2.0

Item {
    id: root

    width: units.gridUnit * 10
    height: units.gridUnit * 4

    PlasmaCore.DataSource {
        id: executable
        engine: "executable"
        connectedSources: []
        onNewData: disconnectSource(sourceName)

        function exec(cmd) {
            executable.connectSource(cmd)
        }
    }

    Plasmoid.fullRepresentation: null
    Plasmoid.preferredRepresentation: Plasmoid.compactRepresentation
    Plasmoid.compactRepresentation: Item{

        Layout.fillHeight: false
        Layout.fillWidth: false
        Layout.minimumWidth: paintArea.width
        Layout.maximumWidth: Layout.minimumWidth
        Layout.minimumHeight: paintArea.height
        Layout.maximumHeight: Layout.minimumHeight

        Row {
            id: paintArea

            leftPadding: plasmoid.configuration.paddingLeft
            rightPadding: plasmoid.configuration.paddingRight
            topPadding: plasmoid.configuration.paddingTop

            anchors.centerIn: parent

            Label{
                id: label
                text: plasmoid.configuration.textLabel
                color: theme.textColor
                font.bold:  plasmoid.configuration.boldText
                horizontalAlignment: Text.AlignHCenter
                verticalAlignment: Text.AlignVCenter
                font.italic: plasmoid.configuration.italicText
                font.pixelSize: plasmoid.configuration.fixedFont ? plasmoid.configuration.fontSize : theme.defaultFont.pixelSize
                minimumPixelSize: 1

            }
        }
        MouseArea {
            anchors.fill: parent
            cursorShape: Qt.PointingHandCursor
            onClicked: {
                executeCommand()
            }
        }
    }

    function executeCommand() {
        executable.exec(plasmoid.configuration.command)
    }
}
