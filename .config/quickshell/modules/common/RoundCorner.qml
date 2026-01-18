// pragma ComponentBehavior: Bound

import QtQuick
import QtQuick.Shapes

Item {
    id: root

    enum CornerPlacement {
        TopLeft,
        TopRight,
        BottomLeft,
        BottomRight
    }

    required property int cornerPlacement
    readonly property bool isTop: root.cornerPlacement === RoundCorner.CornerPlacement.TopLeft || root.cornerPlacement === RoundCorner.CornerPlacement.TopRight
    readonly property bool isBottom: root.cornerPlacement === RoundCorner.CornerPlacement.BottomLeft || root.cornerPlacement === RoundCorner.CornerPlacement.BottomRight
    readonly property bool isLeft: root.cornerPlacement === RoundCorner.CornerPlacement.TopLeft || root.cornerPlacement === RoundCorner.CornerPlacement.BottomLeft
    readonly property bool isRight: root.cornerPlacement === RoundCorner.CornerPlacement.TopRight || root.cornerPlacement === RoundCorner.CornerPlacement.BottomRight
    required property int implicitSize
    required property color color

    implicitWidth: implicitSize
    implicitHeight: implicitSize

    anchors {
        top: root.isTop ? parent.top : undefined
        bottom: root.isBottom ? parent.bottom : undefined
        left: root.isLeft ? parent.left : undefined
        right: root.isRight ? parent.right : undefined
    }

    Shape {
        id: shape

        preferredRendererType: Shape.CurveRenderer // GPU rendering
        layer.enabled: true // Performace optimization, shape caching
        layer.smooth: true // Quality improvement

        ShapePath {
            id: shapePath

            strokeWidth: 0
            fillColor: root.color
            startX: root.isRight ? root.implicitSize : 0
            startY: root.isBottom ? root.implicitSize : 0
            pathHints: ShapePath.PathSolid & ShapePath.PathNonIntersecting

            PathAngleArc {
                moveToStart: false
                centerX: root.implicitSize - shapePath.startX
                centerY: root.implicitSize - shapePath.startY
                radiusX: root.implicitSize
                radiusY: root.implicitSize
                startAngle: {
                    switch (root.cornerPlacement) {
                    case RoundCorner.CornerPlacement.TopLeft:
                        return 180;
                    case RoundCorner.CornerPlacement.TopRight:
                        return 270;
                    case RoundCorner.CornerPlacement.BottomLeft:
                        return 90;
                    case RoundCorner.CornerPlacement.BottomRight:
                        return 0;
                    }
                }
                sweepAngle: 90
            }

            PathLine {
                x: shapePath.startX
                y: shapePath.startY
            }

        }

    }

}
