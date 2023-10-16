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
import org.kde.plasma.plasmoid 2.0
import org.kde.plasma.core 2.0 as PlasmaCore

Item {
    id: procMonitor
    Plasmoid.fullRepresentation: FullRepresentation {}
    function setForm() {
        switch (Plasmoid.formFactor) {
            case PlasmaCore.Types.Vertical:
                Plasmoid.switchWidth = units.gridUnit * 5;
                Plasmoid.switchHeight = 1;
                break;
            case PlasmaCore.Types.Horizontal:
                Plasmoid.switchWidth =  1;
                Plasmoid.switchHeight = units.gridUnit * 5;
                break;
            default:
                Plasmoid.switchWidth =  units.gridUnit * 5;
                Plasmoid.switchHeight = units.gridUnit * 5;
        }
    }
    Component.onCompleted: {
        setForm();
    }
    Plasmoid.onFormFactorChanged: {
        setForm();
    }
}
