import QtQuick
import qs.config
import qs.services
import qs.modules.common

Item {
    implicitWidth: text.implicitWidth

    StyledText {
        id: text

        anchors.centerIn: parent

        text: Time.format("ddd dd MMM hh:mm:ss")
        color: Colorscheme.colors.m3primary
    }
}
