import Qt5Compat.GraphicalEffects
import QtQuick
import Quickshell.Widgets
import qs.config

Item {
    id: root

    required property color color
    required property real size
    required property string iconName
    property string iconPack: ""
    readonly property string packDir: {
        if (iconPack === "") {
            return "";
        }
        else {
            return `${iconPack}/`;
        }
    }

    implicitWidth: size
    implicitHeight: size

    IconImage {
        id: iconImage

        anchors.fill: parent
        source: `${Paths.icons}/${root.packDir}${root.iconName}.svg`
        implicitSize: root.size
    }

    ColorOverlay {
        anchors.fill: parent
        source: iconImage
        color: root.color
    }

}
