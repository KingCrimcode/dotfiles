import QtQuick
import QtQuick.Layouts
import qs.config
import qs.modules.bar.components

RowLayout {
    id: root

    // Left side
    Repeater {
    }

    // Middle
    Repeater {
    }

    // Right side
    Repeater {
    }

    OsIcon {
        Layout.leftMargin: Appearance.padding.large
    }

    Text {
        text: "Hello World!"
        color: Colorscheme.colors.m3onSurfaceVariant
    }

}
