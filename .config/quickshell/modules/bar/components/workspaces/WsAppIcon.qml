pragma ComponentBehavior: Bound

import QtQuick
import Quickshell.Widgets
import qs.config
import qs.services

Item {
    id: root

    required property string modelData

    required property Component wsEffect

    readonly property real iconSize: Appearance.sizes.workspace.iconSize

    IconImage {
        id: icon

        anchors.centerIn: parent
        implicitSize: root.iconSize

        source: IconFinder.find(root.modelData)

        layer.enabled: true
        layer.effect: root.wsEffect

    }

}
