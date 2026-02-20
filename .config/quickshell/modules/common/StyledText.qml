pragma ComponentBehavior: Bound

import QtQuick
import qs.config

Text {
    id: root

    renderType: Text.QtRendering
    textFormat: Text.PlainText

    color: Colorscheme.colors.m3onSurface

    font {
        family: Appearance.font.family.sans
        pointSize: Appearance.font.size.small
    }

}
