pragma Singleton

import QtQuick
import Quickshell

Singleton {
    property string currentPopup: ""
    property bool isOpen: false
    
    function openPopup(popup: string): void {
        if (isOpen) {
            closePopup()
        }
        currentPopup = popup
        isOpen = true
    }

    function closePopup(): void {
        isOpen = false
        currentPopup = ""
    }

    function togglePopup(popup: string): void {
        if (isOpen && currentPopup === popup) {
            closePopup()
        } else if (isOpen && currentPopup !== popup) {
            closePopup()
            openPopup(popup)
        } else {
            openPopup(popup)
        }
    }
}
