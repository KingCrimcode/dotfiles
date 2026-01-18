pragma Singleton

import QtQuick
import Quickshell

Singleton {
    id: root

    readonly property string home: Quickshell.env("HOME")

    readonly property string state: `${Quickshell.env("XDG_STATE_HOME") || `${home}/.local/state`}/quickshell`

    readonly property string assets: Qt.resolvedUrl(Quickshell.shellPath("assets"))
    readonly property string icons: `${assets}/icons`
}
