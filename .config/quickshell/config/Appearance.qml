pragma ComponentBehavior: Bound
pragma Singleton

import QtQuick
import Quickshell

Singleton {
    id: root

    readonly property Padding padding : Padding {}
    readonly property Rounding rounding : Rounding {}
    readonly property Sizes sizes : Sizes {}
    readonly property FontSettings font : FontSettings {}

    component FontSettings: QtObject {
        readonly property string fontFamily: "JetBrains Mono"
        readonly property FontSize size: FontSize {}
    }

    component FontSize: QtObject {
        readonly property real small: 11
        readonly property real normal: 13
        readonly property real large: 18
    }

    component Padding: QtObject {
        readonly property real small: 5
        readonly property real normal: 10
        readonly property real large: 15
    }

    component Rounding: QtObject {
      readonly property real screenRounding: windowRounding + root.sizes.hyprlandGapsOut
      readonly property real windowRounding: 10 // hyprland rounding
    }

    component Sizes: QtObject {
        readonly property real barHeight: 40
        readonly property real hyprlandGapsOut: 7
    }

}
