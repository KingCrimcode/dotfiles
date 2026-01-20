pragma ComponentBehavior: Bound

import QtQuick
import QtQuick.Layouts
import Quickshell.Hyprland
import qs.config
import qs.modules.bar.components.workspaces

Item {
    id: root

    readonly property int workspaceCount: 10

    readonly property int buttonSize: Appearance.sizes.workspace.buttonSize
    readonly property int iconSize: Appearance.sizes.workspace.iconSize
    readonly property int spacing: Appearance.sizes.workspace.spacing

    readonly property int activeWorkspaceId: Hyprland.focusedWorkspace ? 
        Hyprland.focusedWorkspace.id : 1

    readonly property list<var> workspaceDistinctApps: {
        let appList = []
        for (let i = 1; i <= workspaceCount; i++) {
            let workspace = Hyprland.workspaces.values.find(ws => ws.id === i)
            if (workspace === undefined) {
                appList.push([])
                continue
            }
            let appIds = workspace.toplevels.values.map(tl => tl.wayland?.appId)
            appList.push([...new Set(appIds)])
        }
        return appList
    }

    implicitWidth: {
        const defaultSize = root.workspaceCount * root.buttonSize + 
          (root.workspaceCount -1) * root.spacing + 4 * root.spacing
        let addedIconsSize = 0
        workspaceDistinctApps.forEach(apps => {
            addedIconsSize += (apps.length ? apps.length - 1 : 0) * (root.iconSize + root.spacing)
        })
        return defaultSize + addedIconsSize
    }
    implicitHeight: root.buttonSize + 3 * root.spacing

    WheelHandler {
        onWheel: (event) => {
            if (event.angleDelta.y > 0) {
                if (root.activeWorkspaceId < root.workspaceCount) {
                    Hyprland.dispatch("workspace +1")
                  } else {
                    Hyprland.dispatch("workspace 1")
                  }
            } else {
                if (root.activeWorkspaceId > 1) {
                    Hyprland.dispatch("workspace -1")
                  } else {
                    Hyprland.dispatch(`workspace ${root.workspaceCount}`)
                  }
            }
        }
        acceptedDevices: PointerDevice.Mouse | PointerDevice.TouchPad
    }

    Rectangle {
        anchors.fill: parent

        radius: height / 2

        color: Colorscheme.colors.m3surfaceContainerHigh
    }

    RowLayout {
        id: workspacesHolder

        z: 1
        anchors.centerIn: parent

        spacing: root.spacing

        Repeater {
            model: root.workspaceDistinctApps

            Workspace {
                activeWorkspaceId: root.activeWorkspaceId
            }

        }

    }

}
