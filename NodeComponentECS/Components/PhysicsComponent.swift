import SpriteKit
import GameplayKit

struct PhysicsCategory {
    static let none: UInt32 = 0b1
    static let floor: UInt32 = 0b10
    static let circle: UInt32 = 0b100
    static let square: UInt32 = 0b1000
}

class PhysicsComponent: GKComponent {
    var body: SKPhysicsBody?
    var position: CGPoint? = nil {
        didSet {
            print(self, position)
        }
    }

    init(body: SKPhysicsBody) {
        self.body = body
        super.init()
    }

    required init?(coder aDecoder: NSCoder) {
        fatalError("Not implemented")
    }

    override func didAddToEntity() {
        entity?.component(ofType: NodeComponent.self)?.node.physicsBody = body
    }

    override func willRemoveFromEntity() {
        if let touchyNode = entity?.component(ofType: NodeComponent.self)?.node {
            touchyNode.physicsBody = nil
            entity?.component(ofType: PositionComponent.self)?.currentPosition = touchyNode.position
        }
        body = nil
    }
}
