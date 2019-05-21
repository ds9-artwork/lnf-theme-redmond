/*
 * Copyright 2019 Marco Martin <mart@kde.org>
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

import QtQuick 2.1
import QtQuick.Layouts 1.1
import QtQuick.Controls 2.2 as Controls

import org.kde.plasma.core 2.0 as PlasmaCore
import org.kde.plasma.components 3.0 as PlasmaComponents
import org.kde.plasma.plasmoid 2.0

import org.kde.milou 0.1 as Milou

Item {
    id: root
    Plasmoid.preferredRepresentation: Plasmoid.compactRepresentation

    property string query

    Plasmoid.onExpandedChanged: plasmoid.fullRepresentationItem.resultsView.forceActiveFocus()
    Plasmoid.compactRepresentation: PlasmaComponents.TextField {
        id: searchField
        Layout.minimumWidth: units.gridUnit * 10
        placeholderText: i18n("Search...")
        onTextChanged: timer.restart()
        leftPadding: expandButton.width + units.smallSpacing
        rightPadding: clearButton.width + units.smallSpacing
        onActiveFocusChanged: {
            if (activeFocus) {
                plasmoid.status = PlasmaCore.Types.AcceptingInputStatus
            } else {
                plasmoid.status = PlasmaCore.Types.ActiveStatus
            }
        }
        Timer {
            id: timer
            interval: 500
            repeat: false
            onTriggered: plasmoid.fullRepresentationItem.resultsView.setQueryString(searchField.text);
        }
        PlasmaComponents.ToolButton {
            id: expandButton
            icon.name: "search"
            width: Math.min(parent.height - units.smallSpacing * 2, units.iconSizes.large)
            height: width
            enabled: plasmoid.fullRepresentationItem.resultsView.count > 0
            anchors {
                verticalCenter: parent.verticalCenter
                left: parent.left
                leftMargin: units.smallSpacing
            }
            onClicked: plasmoid.expanded = !plasmoid.expanded
        }
        PlasmaComponents.ToolButton {
            id: clearButton
            icon.name: "edit-clear"
            width: Math.min(parent.height - units.smallSpacing * 2, units.iconSizes.large)
            height: width
            visible: searchField.text.length > 0
            anchors {
                verticalCenter: parent.verticalCenter
                right: parent.right
                rightMargin: units.smallSpacing
            }
            onClicked: searchField.text = ""
        }
    }

    Plasmoid.fullRepresentation: Controls.ScrollView {
        Layout.minimumWidth: units.gridUnit * 25
        Layout.minimumHeight: Math.min(resultsView.contentHeight, units.gridUnit * 30)
        Layout.maximumHeight: Math.min(resultsView.contentHeight, units.gridUnit * 30)
        property Milou.ResultsView resultsView: resultsView

        Milou.ResultsView {
            id: resultsView

            onCountChanged: {
                plasmoid.expanded = count > 0
            }

            onActivated: {
                plasmoid.hidePopup()
            }
            Keys.forwardTo: plasmoid.compactRepresentationItem
        }
    }
}
