import GameplayKit

enum NodeType: CaseIterable {
    case label
    case shape
    case sprite
}

class NodeComponent: GKComponent {
    let node = SKNode()
}

// This is essentially a System as it modifies the Component
extension NodeComponent {
    override func update(deltaTime seconds: TimeInterval) {
        if let hasPos = entity?.component(ofType: PositionComponent.self)?.currentPosition {
            node.position = hasPos
        }
    }
}
