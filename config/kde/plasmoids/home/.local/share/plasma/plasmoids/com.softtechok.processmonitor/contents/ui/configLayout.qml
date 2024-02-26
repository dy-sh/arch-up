/*
 * Copyright 2023 Barry Strong <bstrong@softtechok.com>
 *
 * This file is part of Process Monitor Plasmoid
 *
 * Process Monitor Plasmoid is free software: you can redistribute it and/or modify
 * it under the terms of the GNU General Public License as published by
 * the Free Software Foundation, either version 3 of the License, or
 * (at your option) any later version.
 *
 * Process Monitor Plasmoid is distributed in the hope that it will be useful,
 * but WITHOUT ANY WARRANTY; without even the implied warranty of
 * MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the
 * GNU General Public License for more details.
 *
 * You should have received a copy of the GNU General Public License
 * along with System Monitor Plasmoid.  If not, see <https://www.gnu.org/licenses/>.
*/
import QtQuick 2.0
import QtQuick.Controls 2.0
import QtQuick.Layouts 1.0

Item {
    property alias cfg_numProcesses: numProcesses.value
    property alias cfg_sortbyCPU: sortbyCPU.checked
    property alias cfg_sortbyMem: sortbyMem.checked
    property alias cfg_sortbyIOReads: sortbyIOReads.checked
    property alias cfg_sortbyIOWrites: sortbyIOWrites.checked
    property alias cfg_showPID: showPID.checked
    property alias cfg_showName: showName.checked
    property alias cfg_showCPU: showCPU.checked
    property alias cfg_showMem: showMem.checked
    property alias cfg_showIOReads: showIOReads.checked
    property alias cfg_showIOWrites: showIOWrites.checked
    property alias cfg_showBorders: showBorders.checked
    property alias cfg_showHeaders: showHeaders.checked
    property alias cfg_boldHeaders: boldHeaders.checked
    property alias cfg_updateInterval: updateInterval.value

    ColumnLayout {
        RowLayout {
            Layout.alignment: Qt.AlignCenter
            Label {
                text: i18n("Number of Processes to Display")
            }
            SpinBox {
                id: numProcesses
                from: 1
                to: 50
            }
        }
        Label {
            text: " "
        }
        Label {
            Layout.alignment: Qt.AlignCenter
            font.bold: true
            text: i18n("Sort Processes by")
        }
        RowLayout {
            Layout.alignment: Qt.AlignCenter
            RadioButton {
                id: sortbyCPU
                text: i18n("CPU")
            }
            RadioButton {
                id: sortbyMem
                text: i18n("Memory")
            }
            RadioButton {
                id: sortbyIOReads
                text: i18n("Reads")
            }
            RadioButton {
                id: sortbyIOWrites
                text: i18n("Writes")
            }
        }
        Label {
            text: " "
        }
        Label {
            Layout.alignment: Qt.AlignCenter
            font.bold: true
            text: i18n("Information to be listed for each Process")
        }
        RowLayout {
            Layout.alignment: Qt.AlignCenter
            CheckBox {
                id: showName
                text: i18n("Name")
            }
            CheckBox {
                id: showPID
                text: i18n("PID")
            }
            CheckBox {
                id: showCPU
                text: i18n("CPU")
                enabled: !sortbyCPU.checked
            }
            CheckBox {
                id: showMem
                text: i18n("Memory")
                enabled: !sortbyMem.checked
            }
            CheckBox {
                id: showIOReads
                text: i18n("Reads")
                enabled: !sortbyIOReads.checked
            }
            CheckBox {
                id: showIOWrites
                text: i18n("Writes")
                enabled: !sortbyIOWrites.checked
            }
        }
        Label {
            text: " "
        }
        Label {
            Layout.alignment: Qt.AlignCenter
            font.bold: true
            text: i18n("Other Options")
        }
        RowLayout {
            Layout.alignment: Qt.AlignCenter
            CheckBox {
                id: showBorders
                text: i18n("Show Border")
            }
            CheckBox {
                id: showHeaders
                text: i18n("Show Column Headers")
            }
        }
        CheckBox {
            id: boldHeaders
            Layout.alignment: Qt.AlignCenter
            text: i18n("Bold Column Headers")
            enabled: showHeaders.checked
        }
        RowLayout {
            Layout.alignment: Qt.AlignCenter
            Label {
                text: i18n("Update Every")
            }
            SpinBox {
                id: updateInterval
                from: 1
                to: 100
                value: 10
                ToolTip.text: qsTr("Interval between display updates in seconds")
                ToolTip.visible: hovered
                ToolTip.delay: 1000
                ToolTip.timeout: 5000
                inputMethodHints: Qt.ImhFormattedNumbersOnly
                textFromValue: function(value, locale) {
                    return Number(value / 10).toLocaleString(locale, 'f', 1)
                }
                valueFromText: function(text, locale) {
                    return Number.fromLocaleString(locale, text) * 10
                }
                validator: DoubleValidator {
                    bottom: Math.min(updateInterval.from, updateInterval.to)
                    top:  Math.max(updateInterval.from, updateInterval.to)
                }
            }
            Text {
                text: "s"
            }
        }
    }
}
