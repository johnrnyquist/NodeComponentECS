import SpriteKit
import GameplayKit

class GameScene: SKScene {
    var typeArray = [NodeType]()
    var entities: [GKEntity] = []
    var previousTime: TimeInterval = 0
    lazy var systems: [GKComponentSystem] = {
        let render = GKComponentSystem(componentClass: NodeComponent.self)
        return [render]
    }()

    override func update(_ currentTime: TimeInterval) {
        if previousTime == 0 {
            previousTime = currentTime
        }
        let delta = currentTime - previousTime
        for system in systems {
            system.update(deltaTime: delta)
        }
    }

    func addNode(at point: CGPoint) {
        let entity = GKEntity()
        let nodeComponent = NodeComponent()
        if typeArray.isEmpty { typeArray = NodeType.allCases }
        let typeComponent: ChildNode
        switch typeArray.popLast()! {
            case .shape: typeComponent = ShapeComponent(shape: .circle)
            case .label: typeComponent = LabelComponent(text: "Hello")
            case .sprite: typeComponent = SpriteComponent()
        }
        nodeComponent.node.addChild(typeComponent.asNode())
        let positionComponent = PositionComponent(pos: point)
        let scaleComponent = ScaleComponent()
        entity.addComponent(scaleComponent)
        entity.addComponent(nodeComponent)
        entity.addComponent(positionComponent)
        scaleComponent.targetScale = 1.5
        entities.append(entity)
        addChild(nodeComponent.node)
        for system in systems {
            system.addComponent(foundIn: entity)
            print(system.components)
        }
    }

    override func touchesEnded(_ touches: Set<UITouch>, with event: UIEvent?) {
        guard let touch = touches.first else { return }
        entities.last?.component(ofType: ScaleComponent.self)?.targetScale = 0.5
        let loc = touch.location(in: self)
        addNode(at: loc)
    }

    override init(size: CGSize) {
        super.init(size: size)
    }

    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}
