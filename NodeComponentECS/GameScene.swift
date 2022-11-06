import SpriteKit
import GameplayKit

class GameScene: SKScene {
    var nodeTypes = [NodeType]()
    var entities: [GKEntity] = []
    var previousTime: TimeInterval = 0
     var systems: [GKComponentSystem] = {
        [
            PositionSystem(componentClass: PositionComponent.self),
            ScaleSystem(componentClass: ScaleComponent.self),
            ContactSystem(componentClass: ContactComponent.self),
            NodeAndPhysicsSystem(componentClass: NodeComponent.self),
        ]
    }()

    override func didMove(to view: SKView) {
        super.didMove(to: view)
        anchorPoint = CGPoint(x: 0.5, y: 0.5)
        addNode(.floor, at: CGPoint(x: 0, y: -(size.height / 2)))
        physicsWorld.contactDelegate = self
    }

    override func update(_ currentTime: TimeInterval) {
        if previousTime == 0 {
            previousTime = currentTime
        }
        let delta = currentTime - previousTime
        for system in systems {
            system.update(deltaTime: delta)
        }
        previousTime = currentTime
    }

    @discardableResult
    func addNode(_ type: NodeType, at point: CGPoint) -> SKNode {
        let entity = GKEntity()
        let childNode: ChildNode
        let body: SKPhysicsBody?
        switch type {
            case .floor:
                childNode = ShapeComponent(shape: .floor)
                body = SKPhysicsBody(rectangleOf: CGSize(width: 800, height: 20))
                body?.isDynamic = false
                body?.categoryBitMask = PhysicsCategory.floor
                body?.contactTestBitMask = PhysicsCategory.circle | PhysicsCategory.square
                let contactComponent = ContactComponent()
                entity.addComponent(contactComponent)
            case .circle:
                childNode = ShapeComponent(shape: .circle)
                body = nil
//                body = SKPhysicsBody(circleOfRadius: 20)
//                body?.categoryBitMask = PhysicsCategory.circle
            case .square:
                childNode = ShapeComponent(shape: .square)
                body = SKPhysicsBody(rectangleOf: CGSize(width: 50, height: 50))
                body?.categoryBitMask = PhysicsCategory.square
            case .label:
                childNode = LabelComponent(text: "Hello")
                body = nil
            case .sprite:
                childNode = SpriteComponent()
                body = SKPhysicsBody(rectangleOf: CGSize(width: 100, height: 100))
        }
        let nodeComponent = NodeComponent(child: childNode)
        let positionComponent = PositionComponent(position: point)
        let scaleComponent = ScaleComponent()
        entity.addComponent(nodeComponent)
        entity.addComponent(scaleComponent)
        entity.addComponent(positionComponent)
        if let body {
            let physicsComponent = PhysicsComponent(body: body)
            entity.addComponent(physicsComponent)
        }
        scaleComponent.targetScale = 1.5
        entities.append(entity)
        addChild(nodeComponent.node)
        // Add components to systems
        for system in systems {
            system.addComponent(foundIn: entity)
        }
        return nodeComponent.node
    }

    override func touchesEnded(_ touches: Set<UITouch>, with event: UIEvent?) {
        guard let touch = touches.first else { return }
        let loc = touch.location(in: self)
        if nodeTypes.isEmpty {
            nodeTypes = NodeType.allCases
        }
        let type = nodeTypes.popLast()!
        addNode(type, at: loc)
        if loc.y > 0 {
            addNode(.circle, at: loc)
        } else {
            addNode(.square, at: loc)
        }
    }

    override init(size: CGSize) {
        super.init(size: size)
    }

    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}

extension GameScene: SKPhysicsContactDelegate {

    func didBegin(_ contact: SKPhysicsContact) {
        contact.bodyA
               .node?
               .entity?
               .component(ofType: ContactComponent.self)?
               .didMakeContact(with: contact.bodyB.node?.entity)
        contact.bodyB
               .node?
               .entity?
               .component(ofType: ContactComponent.self)?
               .didMakeContact(with: contact.bodyA.node?.entity)
    }
}
