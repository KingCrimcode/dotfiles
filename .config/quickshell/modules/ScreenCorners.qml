pragma ComponentBehavior: Bound

import QtQuick
import Quickshell
import Quickshell.Hyprland
import Quickshell.Wayland
import qs.config
import qs.modules.common

Scope {
    id: root

    Variants {
        model: Quickshell.screens

        delegate: Scope {
            id: monitorScope

            required property var modelData
            property HyprlandMonitor monitor: Hyprland.monitorFor(modelData)

            // Hide on screens with fullscreen apps
            property list<HyprlandWorkspace> workspacesForMonitor: Hyprland.workspaces.values.filter(workspace => workspace.monitor && workspace.monitor.name == monitor.name)
            property var activeWorkspaceWithFulscreen: workspacesForMonitor.filter(workspace => ((workspace.toplevels.values.filter(window => window.wayland?.fullscreen)[0] != undefined) && workspace.active))[0]
            property bool fullscreen: activeWorkspaceWithFulscreen != undefined

            CornerPanelWindow {
                screen: monitorScope.modelData
                fullscreen: monitorScope.fullscreen
                cornerPlacement: RoundCorner.CornerPlacement.TopLeft
            }

            CornerPanelWindow {
                screen: monitorScope.modelData
                fullscreen: monitorScope.fullscreen
                cornerPlacement: RoundCorner.CornerPlacement.TopRight
            }

            CornerPanelWindow {
                screen: monitorScope.modelData
                fullscreen: monitorScope.fullscreen
                cornerPlacement: RoundCorner.CornerPlacement.BottomLeft
            }

            CornerPanelWindow {
                screen: monitorScope.modelData
                fullscreen: monitorScope.fullscreen
                cornerPlacement: RoundCorner.CornerPlacement.BottomRight
            }

        }

    }

    component CornerPanelWindow: PanelWindow {
        id: cornerPanelWindow

        required property bool fullscreen
        required property int cornerPlacement
        property var screen: QsWindow.window?.screen

        visible: !fullscreen
        exclusionMode: ExclusionMode.Ignore
        WlrLayershell.namespace: "quickshell:screen-corners"
        WlrLayershell.layer: WlrLayer.Overlay
        color: "transparent"
        implicitWidth: cornerWidget.implicitWidth
        implicitHeight: cornerWidget.implicitHeight

        anchors {
            top: cornerWidget.isTop
            bottom: cornerWidget.isBottom
            left: cornerWidget.isLeft
            right: cornerWidget.isRight
        }

        RoundCorner {
            id: cornerWidget

            cornerPlacement: cornerPanelWindow.cornerPlacement
            // color: Colorscheme.colors.m3primary
            color: Colorscheme.colors.m3shadow
            implicitSize: Appearance.rounding.screenRounding
        }

    }

}
