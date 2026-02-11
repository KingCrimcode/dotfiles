pragma ComponentBehavior: Bound
pragma Singleton

import QtQuick
import Quickshell

Singleton {
    id: root

    readonly property FontSettings font : FontSettings {}
    readonly property Misc misc : Misc {}
    readonly property Padding padding : Padding {}
    readonly property Rounding rounding : Rounding {}
    readonly property Sizes sizes : Sizes {}

    component Misc: QtObject {
        readonly property real barOpacity: 0.9
    }

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
        readonly property real hyprlandGapsOut: 7
        readonly property Bar bar: Bar {}
    }

    component Bar: QtObject {
        readonly property real height: 40
        readonly property real containerHeight: 34
        readonly property Workspace workspace : Workspace {}
        readonly property StatusBar statusBar : StatusBar {}
    }

    component Workspace: QtObject {
        readonly property real buttonSize: 28
        readonly property real iconSize: 16
        readonly property real spacing: 2
    }

    component StatusBar : QtObject {
        readonly property real iconSize: 20
        readonly property real iconSpacing: 5
    }

}
