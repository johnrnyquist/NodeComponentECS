import SpriteKit
import GameplayKit

class LabelComponent: GKComponent, ChildNode {
    let label: SKLabelNode

    init(text: String) {
        label = SKLabelNode(text: text)
        super.init()
    }

    func asNode() -> SKNode {
        return label
    }

    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}
