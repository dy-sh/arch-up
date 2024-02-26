/*
 * Copyright 2013  Bhushan Shah <bhush94@gmail.com>
 * Copyright 2013 Sebastian Kügler <sebas@kde.org>
 * Copyright 2015 Kai Uwe Broulik <kde@privat.broulik.de>
 *
 * This program is free software; you can redistribute it and/or
 * modify it under the terms of the GNU General Public License as
 * published by the Free Software Foundation; either version 2 of
 * the License or (at your option) version 3 or any later version
 * accepted by the membership of KDE e.V. (or its successor approved
 * by the membership of KDE e.V.), which shall act as a proxy
 * defined in Section 14 of version 3 of the license.
 *
 * This program is distributed in the hope that it will be useful,
 * but WITHOUT ANY WARRANTY; without even the implied warranty of
 * MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the
 * GNU General Public License for more details.
 *
 * You should have received a copy of the GNU General Public License
 * along with this program.  If not, see <http://www.gnu.org/licenses/>
 */

import QtQuick 2.0
import QtQuick.Controls 2.3 as QtControls
import QtQuick.Layouts 1.0 as QtLayouts
import org.kde.kirigami 2.5 as Kirigami

Kirigami.FormLayout {

    anchors.left: parent.left
    anchors.right: parent.right



    signal configurationChanged

    property alias cfg_boldText: boldCheckBox.checked
    property alias cfg_italicText: italicCheckBox.checked
    property alias cfg_fixedFont: fixedFont.checked
    property alias cfg_fontSize: fontSize.value
    property alias cfg_paddingRight: paddingRight.value
    property alias cfg_paddingTop: paddingTop.value
    property alias cfg_paddingLeft: paddingLeft.value
    property alias cfg_command: command.text
    property alias cfg_textLabel: labelText.text



    QtLayouts.Layout.fillWidth: true

    Item {
        Kirigami.FormData.isSection: true
    }




    QtLayouts.RowLayout {
        QtLayouts.Layout.fillWidth: true

        Kirigami.FormData.label: i18n("Font Size:")
        Kirigami.FormData.buddyFor: fontSize

        QtControls.CheckBox {
            id: fixedFont
            text: i18n("Use fixed font size")
        }

        QtControls.SpinBox {
            id: fontSize
            enabled: cfg_fixedFont
            from: 1
            to: 60
            editable: true
            validator: IntValidator {
                locale: fontSize.locale.name
                bottom: Math.min(fontSize.from, fontSize.to)
                top: Math.max(fontSize.from, fontSize.to)
            }
        }
    }



    Item {
        Kirigami.FormData.isSection: true
    }

    QtLayouts.RowLayout {
        QtLayouts.Layout.fillWidth: true

        Kirigami.FormData.label: i18n("Font style:")


        QtControls.Button {
            id: boldCheckBox
            QtControls.ToolTip {
                text: i18n("Bold text")
            }
            icon.name: "format-text-bold"
            checkable: true
            //Accessible.name: tooltip
        }

        QtControls.Button {
            id: italicCheckBox
            QtControls.ToolTip {
                text: i18n("Italic text")
            }
            icon.name: "format-text-italic"
            checkable: true
            //Accessible.name: tooltip
        }
    }

    Item {
        Kirigami.FormData.isSection: true
    }

    QtLayouts.RowLayout {
        QtLayouts.Layout.fillWidth: true

        Kirigami.FormData.label: i18n("Left spacing:")
        Kirigami.FormData.buddyFor: paddingLeft

        QtControls.SpinBox {
            id: paddingLeft
            from: 0
            to: 30
            editable: true
            validator: IntValidator {
                locale: paddingLeft.locale.name
                bottom: Math.min(paddingLeft.from, paddingLeft.to)
                top: Math.max(paddingLeft.from, paddingLeft.to)
            }
        }
    }

    QtLayouts.RowLayout {
        QtLayouts.Layout.fillWidth: true

        Kirigami.FormData.label: i18n("Right spacing:")
        Kirigami.FormData.buddyFor: paddingRight

        QtControls.SpinBox {
            id: paddingRight
            from: 0
            to: 30
            editable: true
            validator: IntValidator {
                locale: paddingRight.locale.name
                bottom: Math.min(paddingRight.from, paddingRight.to)
                top: Math.max(paddingRight.from, paddingRight.to)
            }
        }
    }

    QtLayouts.RowLayout {
        QtLayouts.Layout.fillWidth: true

        Kirigami.FormData.label: i18n("Top spacing:")
        Kirigami.FormData.buddyFor: paddingTop

        QtControls.SpinBox {
            id: paddingTop
            from: 0
            to: 30
            editable: true
            validator: IntValidator {
                locale: paddingTop.locale.name
                bottom: Math.min(paddingTop.from, paddingTop.to)
                top: Math.max(paddingTop.from, paddingTop.to)
            }
        }
    }

    QtLayouts.RowLayout {
        QtLayouts.Layout.fillWidth: true

        Kirigami.FormData.label: i18n("Text:")

        QtControls.TextField{
            id: labelText
        }
    }

    QtControls.Label {
        text: i18n("Symbols examples in: https://coolsymbol.com/")
    }

    QtLayouts.RowLayout {
        QtLayouts.Layout.fillWidth: true

        Kirigami.FormData.label: i18n("Command:")

        QtControls.TextField{
            id: command
        }
    }
    QtLayouts.RowLayout {
        QtLayouts.Layout.fillWidth: true

        QtControls.Button {
            text: 'Reset'
            onClicked: command.text = 'qdbus org.kde.kglobalaccel /component/kwin invokeShortcut Overview'
        }
    }

    QtControls.Label {
        text: i18n("Kwin examples or customize your command:")
        wrapMode: Text.Wrap
    }
    QtLayouts.RowLayout {
        QtLayouts.Layout.fillWidth: true
        QtControls.TextField {
            QtLayouts.Layout.minimumWidth: 300
            text: i18n("qdbus org.kde.kglobalaccel /component/kwin invokeShortcut Expose")
            wrapMode: Text.NoWrap
            readOnly: true
        }
    }
    QtLayouts.RowLayout {
        QtLayouts.Layout.fillWidth: true

        QtControls.TextField {
            text: i18n("qdbus org.kde.kglobalaccel /component/kwin invokeShortcut Overview")
            wrapMode: Text.NoWrap
            readOnly: true
            QtLayouts.Layout.minimumWidth: 300
        }
        QtControls.Label{
            text: 'Only Plasma 5.24'
        }
    }


}
