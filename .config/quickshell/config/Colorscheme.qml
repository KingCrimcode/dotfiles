import QtQuick
import Quickshell
import Quickshell.Io
import qs.config
pragma Singleton

Singleton {
    id: root

    readonly property Material3 colors: Material3 {}

    function loadFromFile(data: string): void {
        const scheme = JSON.parse(data);

        for (const [key, value] of Object.entries(scheme.colors)) {
            const camelKey = "m3" + key.replace(/_([a-z])/g, (_, letter) => letter.toUpperCase());

            if (colors.hasOwnProperty(camelKey)) {
                colors[camelKey] = value.default;
            }
        }
    }

    FileView {
        path: Paths.colorscheme
        watchChanges: true
        onFileChanged: reload()
        onLoaded: root.loadFromFile(text())
    }

    component Material3: QtObject {
        property color m3background: "#17130b"
        property color m3onBackground: "#ebe1d4"
        property color m3outline: "#998f80"
        property color m3outlineVariant: "#4d4639"
        property color m3surface: "#17130b"
        property color m3surfaceBright: "#3e382f"
        property color m3surfaceDim: "#17130b"
        property color m3onSurface: "#ebe1d4"
        property color m3surfaceTint: "#eac16c"
        property color m3surfaceVariant: "#4d4639"
        property color m3onSurfaceVariant: "#d1c5b4"
        property color m3surfaceContainerLowest: "#120e07"
        property color m3surfaceContainerLow: "#1f1b13"
        property color m3surfaceContainer: "#241f17"
        property color m3surfaceContainerHigh: "#2e2921"
        property color m3surfaceContainerHighest: "#39342b"
        property color m3inverseSurface: "#ebe1d4"
        property color m3inverseOnSurface: "#353027"
        property color m3primary: "#eac16c"
        property color m3onPrimary: "#402d00"
        property color m3primaryContainer: "#5c4300"
        property color m3onPrimaryContainer: "#ffdea1"
        property color m3primaryFixed: "#ffdea1"
        property color m3primaryFixedDim: "#eac16c"
        property color m3onPrimaryFixed: "#261900"
        property color m3onPrimaryFixedVariant: "#5c4300"
        property color m3inversePrimary: "#78590c"
        property color m3secondary: "#d8c4a0"
        property color m3onSecondary: "#3b2f15"
        property color m3secondaryContainer: "#53452a"
        property color m3onSecondaryContainer: "#f5e0bb"
        property color m3secondaryFixed: "#f5e0bb"
        property color m3secondaryFixedDim: "#d8c4a0"
        property color m3onSecondaryFixed: "#241a04"
        property color m3onSecondaryFixedVariant: "#53452a"
        property color m3tertiary: "#b1cfa9"
        property color m3onTertiary: "#1e361b"
        property color m3tertiaryContainer: "#344d30"
        property color m3onTertiaryContainer: "#cdebc3"
        property color m3tertiaryFixed: "#cdebc3"
        property color m3tertiaryFixedDim: "#b1cfa9"
        property color m3onTertiaryFixed: "#082008"
        property color m3onTertiaryFixedVariant: "#344d30"
        property color m3error: "#ffb4ab"
        property color m3onError: "#690005"
        property color m3errorContainer: "#93000a"
        property color m3onErrorContainer: "#ffdad6"
        property color m3scrim: "#000000"
        property color m3shadow: "#000000"
        property color m3sourceColor: "#c6a54f"
    }

}
