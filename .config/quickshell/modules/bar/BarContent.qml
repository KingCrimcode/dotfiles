pragma ComponentBehavior: Bound
import QtQuick
import QtQuick.Layouts
import qs.config
import qs.modules.bar.components
import qs.modules.bar.components.workspaces

RowLayout {
    id: root

    readonly property DelegateChooser mapper: DelegateChooser {
        role: "id"

        DelegateChoice {
            roleValue: "osIcon"

            delegate: Loader {
                sourceComponent: OsIcon {}
            }
        }

        DelegateChoice {
            roleValue: "workspaces"

            delegate: Loader {
                sourceComponent: Workspaces {
                    Layout.fillHeight: true
                }
            }
        }
    }

    // Left side margin
    Item {
      Layout.leftMargin: Appearance.padding.large
    }

    // Left side widgets
    Repeater {
        id: repeaterLeft

        model: BarWidgets.left
        delegate: root.mapper
    }

    // Left side spacer
    Item {
        Layout.fillWidth: enabled
    }

    // Center widgets
    Repeater {
        id: repeaterMiddle

        model: BarWidgets.center
        delegate: root.mapper
    }

    // Right side spacer
    Item {
        Layout.fillWidth: enabled
    }

    // Right side widgets
    Repeater {
        id: repeaterRight

        model: BarWidgets.right
        delegate: root.mapper
    }

    // Right side margin
    Item {
        Layout.rightMargin: Appearance.padding.large
    }

}
