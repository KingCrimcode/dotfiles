pragma ComponentBehavior: Bound

import QtQuick
import QtQuick.Layouts
import QtQuick.Effects
import Quickshell.Hyprland
import qs.config
import qs.modules.bar.components.workspaces

Item {
    id: root

    required property list<string> modelData
    required property int index

    required property int activeWorkspaceId

    readonly property bool isActive: root.index + 1 === root.activeWorkspaceId
    readonly property bool isHovered: area.hovered
    readonly property bool isEmpty: root.modelData.length === 0

    readonly property int buttonSize: Appearance.sizes.workspace.buttonSize
    readonly property int iconSize: Appearance.sizes.workspace.iconSize
    readonly property int spacing: Appearance.sizes.workspace.spacing

    readonly property color color: root.isHovered ? Colorscheme.colors.m3primaryContainer
        : root.isActive ? Colorscheme.colors.m3secondaryContainer
        : Colorscheme.colors.m3surfaceContainerHighest

    implicitWidth: root.buttonSize + (root.modelData.length ? root.modelData.length - 1 : 0) * (root.iconSize + root.spacing)
    implicitHeight: root.buttonSize

    TapHandler {
        onPressedChanged: {
            if (pressed && root.activeWorkspaceId !== root.index + 1) 
              Hyprland.dispatch(`workspace ${root.index + 1}`)
        }
    }

    HoverHandler {
        id: area
    }
    
    Rectangle {
        id: workspaceBackground

        anchors.fill: parent

        radius: height / 2

        color: root.color
        opacity: (!root.isEmpty || root.isActive || root.isHovered) ? 1 : 0
    }

    Rectangle {
        visible: root.isEmpty
        anchors.centerIn: parent
        width: root.buttonSize * 0.2
        height: width
        radius: width / 2
        color: root.isHovered ? Colorscheme.colors.m3onPrimaryContainer
            : root.isActive ? Colorscheme.colors.m3onSecondaryContainer
            : Colorscheme.colors.m3secondaryContainer

        layer.enabled: true
        layer.effect: wsEffect
    }

    RowLayout {
        anchors.fill: parent
        anchors.leftMargin: root.buttonSize / 2
        spacing: root.spacing

        Repeater {
            model: root.modelData

            WsAppIcon {
                wsEffect: wsEffect
            }

        }

    }

    Component {
        id: wsEffect

        MultiEffect {
          saturation: 0.3
          colorization: 0.7
          colorizationColor: root.color
          brightness: 0.8
          contrast: 0.8
        }
    }

}
