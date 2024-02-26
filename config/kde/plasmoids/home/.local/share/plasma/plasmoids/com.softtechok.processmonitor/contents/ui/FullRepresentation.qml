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

import QtQuick 2.5
import QtQuick.Layouts 1.0
import org.kde.plasma.components 2.0 as PlasmaComponents
import Processes 1.0

Rectangle {
    id: viewPort
    color: "transparent"
    radius: 3;
    property var numClkTicks
    property var rowWidth: 0
    property var rowHeight: 0
    property var disHeight: 0
    border {
        property color borderColor: theme.textColor
        color: Qt.hsla(borderColor.hslHue,
            borderColor.hslSaturation,
            borderColor.hslLightness, .5)
        width: plasmoid.configuration.showBorders ? 1 : 0
    }
    Component {
        id: listHeader;
        Row {
            spacing: 5
            property font hdrFont: pinfo.getFixedFont()
            Component {
                id: hdrText
                PlasmaComponents.Label {
                    font: hdrFont
                    height: text.paintedHeight
                    text: hdrValue
                }
            }
            Loader {
                property var hdrValue: "Name           "
                sourceComponent: plasmoid.configuration.showName ? hdrText : undefined
            }
            Loader {
                property var hdrValue: "     PID"
                sourceComponent: plasmoid.configuration.showPID ? hdrText : undefined
            }
            Loader {
                property var hdrValue: "   CPU"
                sourceComponent: plasmoid.configuration.showCPU ||
                    plasmoid.configuration.sortbyCPU ? hdrText : undefined
            }
            Loader {
                property var hdrValue: "  Memory"
                sourceComponent: plasmoid.configuration.showMem ||
                    plasmoid.configuration.sortbyMem ? hdrText : undefined
            }
            Loader {
                property var hdrValue: "     Read"
                sourceComponent: plasmoid.configuration.showIOReads ||
                    plasmoid.configuration.sortbyIOReads ? hdrText : undefined
            }
            Loader {
                property var hdrValue: "    Write"
                sourceComponent: plasmoid.configuration.showIOWrites ||
                    plasmoid.configuration.sortbyIOWrites ? hdrText : undefined
            }
        }
    }
    Component {
        id: listItem
        Row {
            spacing: 5
            property font itemFont: pinfo.getFixedFont()
            Component {
                id: colItem
                PlasmaComponents.Label {
                    font: itemFont
                    height: text.paintedHeight
                    text: itmValue
                }
            }
            Loader {
                property var itmValue: name
                sourceComponent: plasmoid.configuration.showName ? colItem : undefined
            }
            Loader {
                property var itmValue: pid
                sourceComponent: plasmoid.configuration.showPID ? colItem : undefined
            }
            Loader {
                property var itmValue: cpu
                sourceComponent: plasmoid.configuration.showCPU ||
                    plasmoid.configuration.sortbyCPU? colItem : undefined
            }
            Loader {
                property var itmValue: mem
                sourceComponent: plasmoid.configuration.showMem ||
                    plasmoid.configuration.sortbyMem? colItem : undefined
            }
            Loader {
                property var itmValue: ior
                sourceComponent: plasmoid.configuration.showIOReads ||
                    plasmoid.configuration.sortbyIOReads? colItem : undefined
            }
            Loader {
                property var itmValue: iow
                sourceComponent: plasmoid.configuration.showIOWrites ||
                    plasmoid.configuration.sortbyIOWrites? colItem : undefined
            }
        }
    }
    ListView {
        id: procView
        anchors.fill: parent
        width: parent.width
        height: parent.height
        anchors.leftMargin: viewPort.border.width * 4
        interactive: false
        clip: true
        model: procModel
    }
    ListModel {
        id: procModel
    }
    PInfo {
        id: pinfo
    }
    Timer {
        id: updTimer
        interval: plasmoid.configuration.updateInterval * 100
        running: true
        repeat: true

        onTriggered: {
            pinfo.updateProcesses();
        }
    }
    function checkWidth() {
        if (width > rowWidth) {
            procView.anchors.leftMargin = Math.floor((width - rowWidth) / 2) +
                (viewPort.border.width * 4);
        } else {
            procView.anchors.leftMargin = viewPort.border.width * 4;
        }
    }
    function checkHeight() {
        if (height > disHeight) {
            procView.anchors.topMargin = Math.floor((height - disHeight) / 2) +
                viewPort.border.width;
        } else {
            procView.anchors.topMargin = viewPort.border.width;
        }
    }
    onWidthChanged: {
        checkWidth();
    }
    onHeightChanged: {
        checkHeight();
    }
    function setWidth() {
        rowWidth = Math.ceil(procView.headerItem.width) + (viewPort.border.width * 8);
        rowHeight = Math.ceil(procView.headerItem.height);
        if (rowWidth < width)
            checkWidth();
        viewPort.Layout.minimumWidth = rowWidth;
        viewPort.Layout.preferredWidth = rowWidth;
    }
    function setHeight() {
        disHeight = rowHeight * plasmoid.configuration.numProcesses;
        disHeight += (viewPort.border.width * 2);
        if (plasmoid.configuration.showHeaders) {
            disHeight += rowHeight;
        }
        if (disHeight < height)
            checkHeight();
        viewPort.Layout.minimumHeight = disHeight;
        viewPort.Layout.preferredHeight = disHeight;
    }
    function setHdr() {
        if (procView.header != null)
            procView.header = null;
        procView.header = listHeader;
        setWidth();
        if (plasmoid.configuration.showHeaders) {
            procView.headerItem.hdrFont.bold = plasmoid.configuration.boldHeaders;
        } else {
            procView.header = null;
        }
    }
    function setList() {
        if (procView.delegate != null)
            procView.delegate = null;
        procView.delegate = listItem;
        setHdr();
    }
    function getSortField() {
        if (plasmoid.configuration.sortbyCPU) return 1;
        if (plasmoid.configuration.sortbyMem) return 2;
        if (plasmoid.configuration.sortbyIOReads) return 3;
        if (plasmoid.configuration.sortbyIOWrites) return 4;
    }
    function setFastMem() {
        pinfo.setFastMem(!(plasmoid.configuration.sortbyMem || plasmoid.configuration.showMem));
    }
    Connections {
        target: plasmoid.configuration
        function onNumProcessesChanged() {
            procModel.clear();
            pinfo.setNumProcesses(plasmoid.configuration.numProcesses);
            setHeight();
        }
        function onShowNameChanged() {
            setList();
        }
        function onShowPIDChanged() {
            setList();
        }
        function onShowCPUChanged() {
            if (!plasmoid.configuration.sortbyCPU)
                setList();
        }
        function onShowMemChanged() {
            if (!plasmoid.configuration.sortbyMem) {
                setFastMem();
                setList();
            }
        }
        function onShowIOReadsChanged() {
            if (!plasmoid.configuration.sortbyIOReads)
                setList();
        }
        function onShowIOWritesChanged() {
            if (!plasmoid.configuration.sortbyIOWrites)
                setList();
        }
        function onSortbyCPUChanged() {
            if (plasmoid.configuration.sortbyCPU)
                pinfo.setSortField(getSortField());
            if (!plasmoid.configuration.showCPU)
                setList();
        }
        function onSortbyMemChanged() {
            if (plasmoid.configuration.sortbyMem)
                pinfo.setSortField(getSortField());
            if (!plasmoid.configuration.showMem) {
                setFastMem();
                setList();
            }
        }
        function onSortbyIOReadsChanged() {
            if (plasmoid.configuration.sortbyIOReads)
                pinfo.setSortField(getSortField());
            if (!plasmoid.configuration.showIOReads)
                setList();
        }
        function onSortbyIOWritesChanged() {
            if (plasmoid.configuration.sortbyIOWrites)
                pinfo.setSortField(getSortField());
            if (!plasmoid.configuration.showIOWrites)
                setList();
        }
        function onShowBordersChanged() {
            setHdr();
            setHeight();
        }
        function onShowHeadersChanged() {
            setHdr();
            setHeight();
        }
        function onBoldHeadersChanged() {
            if (plasmoid.configuration.showHeaders)
                procView.headerItem.hdrFont.bold = plasmoid.configuration.boldHeaders;
        }
    }
    Connections {
        target: pinfo
        function onResult(totalCPU, procIDs, procNames, procCPU, procMem, procDRead, procDWrite) {
            var numSecs;

            function fmtData (value, len, suffix) {
                value = value.toFixed(1).substring(0, len);
                if (value != "0.0") {
                    value = value.padStart(len) + suffix;
                } else {
                    value = "".padStart(len + suffix.length);
                }
                return value;
            }
            numSecs = totalCPU / numClkTicks
            for (var idx = 0; idx < plasmoid.configuration.numProcesses; idx++) {
                procModel.set(idx, {
                    name: procNames[idx].substring(0, 15).padEnd(15),
                    pid: procIDs[idx].substring(0, 8).padStart(8),
                    cpu: fmtData((procCPU[idx] / totalCPU) * 100, 5, "%"),
                    mem: fmtData(procMem[idx] / 1024, 7, "M"),
                    ior: fmtData(procDRead[idx] / 1048576 / numSecs, 7, "Ms"),
                    iow: fmtData(procDWrite[idx] / 1048576 / numSecs, 7, "Ms")
                });
            }
        }
    }
    Component.onCompleted: {
        numClkTicks = pinfo.getClkTicks() * pinfo.getNumProcs();
        setList();
        setHeight();
        pinfo.configProcesses(plasmoid.configuration.numProcesses, getSortField(),
            !(plasmoid.configuration.sortbyMem || plasmoid.configuration.showMem));
    }
}
