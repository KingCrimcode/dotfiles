pragma ComponentBehavior: Bound

import QtQuick
import Quickshell
import Quickshell.Wayland
import qs.config
import qs.modules.common

// Bar panel space allocation + background  + decorators
Scope {
    id: root

    readonly property real barHeight: Appearance.sizes.bar.height

    Variants {
        model: Quickshell.screens

        delegate: PanelWindow {
            id: barRoot

            required property ShellScreen modelData
            screen: modelData

            exclusiveZone: root.barHeight
            implicitHeight: root.barHeight + Appearance.rounding.screenRounding
            WlrLayershell.namespace: "quickshell:bar"
            color: "transparent"

            anchors {
                top: true
                bottom: false
                left: true
                right: true
            }

            Item {
                id: barArea

                implicitHeight: root.barHeight

                anchors {
                    top: parent.top
                    bottom: undefined
                    left: parent.left
                    right: parent.right
                }

                Rectangle {
                    id: barBackground

                    anchors.fill: parent

                    color: Colorscheme.colors.m3surfaceContainerLow
                    opacity: Appearance.misc.barOpacity
                }

                BarContent {
                    id: barContent

                    anchors.fill: parent

                    implicitHeight: root.barHeight
                }

            }

            Item {
                id: roundDecorators

                implicitHeight: Appearance.rounding.screenRounding

                anchors {
                    top: barArea.bottom
                    bottom: undefined
                    left: parent.left
                    right: parent.right
                }

                RoundCorner {
                    id: leftCorner

                    cornerPlacement: RoundCorner.CornerPlacement.TopLeft
                    implicitSize: Appearance.rounding.screenRounding
                    color: barBackground.color
                }

                RoundCorner {
                    id: rightCorner

                    cornerPlacement: RoundCorner.CornerPlacement.TopRight
                    implicitSize: Appearance.rounding.screenRounding
                    color: barBackground.color
                }

            }

        }

    }

}
