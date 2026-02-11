pragma ComponentBehavior: Bound

import QtQuick
import QtQuick.Layouts
import qs.config
import qs.modules.common

Item {
    id: root

    readonly property real iconSize: Appearance.sizes.bar.statusBar.iconSize
    readonly property real spacing: Appearance.sizes.bar.statusBar.iconSpacing

    readonly property ListModel model: BarWidgets.status

    implicitWidth: iconSize * model.count + spacing * (model.count + 3)
    implicitHeight: Appearance.sizes.bar.containerHeight


    Rectangle {
        anchors.fill: parent

        radius: height / 2

        color: Colorscheme.colors.m3surfaceContainerHigh
    }

    RowLayout {
        z: 1
        anchors.centerIn: parent
        spacing: root.spacing

        Repeater {
            model: root.model

            DelegateChooser {
                role: "id"

                StatusItem {
                    iconName: "battery-full"
                    popoutName: "battery"
                }

                StatusItem {
                    iconName: "bluetooth"
                    popoutName: "bluetooth"
                }

                StatusItem {
                    iconName: "network"
                    popoutName: "internet"
                }

                StatusItem {
                    iconName: "speaker-high"
                    popoutName: "volume"
                }

            }

        }

    }

    component StatusItem: DelegateChoice {
        id: status

        required property string iconName
        required property string popoutName

        roleValue: popoutName

        delegate: ColoredIcon {
            color: Colorscheme.colors.m3primary
            size: root.iconSize
            iconName: status.iconName
            iconPack: "phosphor"
        }

    }

}
