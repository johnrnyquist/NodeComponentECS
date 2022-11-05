import SpriteKit
import GameplayKit

enum Shape {
    case circle
    case square
    case floor
}

class ShapeComponent: GKComponent, ChildNode {
    let shape: SKShapeNode

    init(shape type: Shape) {
        switch type {
            case .circle:
                shape = SKShapeNode(circleOfRadius: 20)
                shape.fillColor = .purple
            case .square:
                shape = SKShapeNode(rectOf: CGSize(width: 50, height: 50))
                shape.fillColor = .red
            case .floor:
                shape = SKShapeNode(rectOf: CGSize(width: 800, height: 20))
                shape.fillColor = .orange
        }
        super.init()
    }

    func asNode() -> SKNode { shape }

    required init?(coder: NSCoder) {
        fatalError()
    }
}
