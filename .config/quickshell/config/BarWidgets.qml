import Quickshell
import Quickshell.Io
import QtQuick
import qs.config
pragma Singleton

Singleton {
    id: root

    property ListModel left: ListModel {}
    property ListModel center: ListModel {}
    property ListModel right: ListModel {}

    function loadFromFile(data: string): void {
        try {
            const widgets = JSON.parse(data);
            widgets.left.forEach(widget => left.append({id: widget}))
            widgets.center.forEach(widget => center.append({id: widget}))
            widgets.right.forEach(widget => right.append({id: widget}))
        } catch(e) {
            console.error("failed to parse widgets config:", e)
        }
        console.log(left.count)
    }

    FileView {
        path: Paths.barWidgets
        watchChanges: true
        onFileChanged: reload()
        onLoaded: root.loadFromFile(text())
    }
}
