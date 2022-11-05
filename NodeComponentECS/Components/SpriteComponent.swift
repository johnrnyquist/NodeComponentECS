import SpriteKit
import GameplayKit

class SpriteComponent: GKComponent, ChildNode {
    func asNode() -> SKNode {
        return sprite
    }

    let sprite: SKSpriteNode

    override init() {
        sprite = SKSpriteNode(color: .red, size: CGSize(width: 100, height: 100))
        super.init()
    }

    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }

}
