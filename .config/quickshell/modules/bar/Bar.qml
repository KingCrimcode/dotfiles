import QtQuick
import Quickshell
import Quickshell.Wayland
import qs.config
import qs.modules.common

// Bar panel space allocation + background  + decorators
Scope {
    id: bar

    Variants {
        model: Quickshell.screens

        delegate: PanelWindow {
            id: barRoot

            required property ShellScreen modelData
            screen: modelData

            exclusiveZone: Appearance.sizes.barHeight
            implicitHeight: Appearance.sizes.barHeight + Appearance.rounding.screenRounding
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

                implicitHeight: Appearance.sizes.barHeight

                anchors {
                    top: parent.top
                    bottom: undefined
                    left: parent.left
                    right: parent.right
                }

                Rectangle {
                    id: barBackground

                    color: Colorscheme.colors.m3surfaceContainer
                    anchors.fill: parent
                }

                BarContent {
                    id: barContent

                    implicitHeight: Appearance.sizes.barHeight
                    anchors.fill: parent
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
