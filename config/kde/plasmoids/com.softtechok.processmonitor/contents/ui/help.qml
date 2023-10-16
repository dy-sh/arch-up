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
    ColumnLayout {
        Label {
            id: helpText
        }
    }
    Component.onCompleted: {
        helpText.text =
            "  Number of Processes to Display:\n" +
            "      Sets the number of rows in the display.\n" +
            "  Sort Processes by:\n" +
            "      Sets the information to sort on. Higher values will be shown\n" +
            "      at the top of the list. This Information will also be\n" +
            "      displayed as a column in the list.\n" +
            "  Information to be listed for each Process:\n" +
            "      Sets additional information displayed as columns in the list.\n" +
            "  Show Borders:\n" +
            "      Creates a thin border around the list.\n" +
            "  Show Column Headers:\n" +
            "      Add a header above each column.\n" +
            "  Bold Column Headers:\n" +
            "      Display column headers with bold font.\n" +
            "  The system defined fixed width font is used for the Process list,\n" +
            "      it can be changed in System Settings, Appearance, Fonts.\n" +
            "  Update Everly:\n" +
            "      How often to update the list in seconds.\n" +
            "  When added to a panel or other small space Process Monitor\n" +
            "      will only show an icon, Left click the icon to show the\n" +
            "      full display in a popup."
    }
}
