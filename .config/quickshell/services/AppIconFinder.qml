pragma Singleton

import QtQuick
import Quickshell

Singleton {
    id: root

    // Entries are not loaded at the start, so icons need to be reloaded on changes
    // This is a binding to force the icon lookup to be re-evaluated
    property int desktopEntriesVersion: 0
    Connections {
        target: DesktopEntries
        function onApplicationsChanged() {
            root.desktopEntriesVersion++;
        }
    }

    function getIcon(appName: string) : string {
        if (!appName || appName.length === 0)
            return "image-missing";

        desktopEntriesVersion;

        const exactEntry = DesktopEntries.byId(appName);
        if (exactEntry) {
            return exactEntry.icon;
        }

        const heuristicEntry = DesktopEntries.heuristicLookup(appName);
        if (heuristicEntry) {
            return heuristicEntry.icon;
        }

        return "application-x-executable";
    }

    function find(appName: string) : url {
        return Quickshell.iconPath(root.getIcon(appName), true);
    }

}
