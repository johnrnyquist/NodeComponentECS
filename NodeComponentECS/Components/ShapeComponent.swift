import SpriteKit
import GameplayKit

enum Shape {
    case circle, square
}

class ShapeComponent: GKComponent, ChildNode {
    let shape: SKShapeNode

    init(shape: Shape) {
        switch shape {
            case .circle: self.shape = SKShapeNode(circleOfRadius: 20)
            case .square: self.shape = SKShapeNode(rect: CGRect(x: 0, y: 0, width: 20, height: 20))
        }
        self.shape.fillColor = .purple
        super.init()
    }

    func asNode() -> SKNode {
        return shape
    }

    required init?(coder: NSCoder) {
        fatalError()
    }
}
