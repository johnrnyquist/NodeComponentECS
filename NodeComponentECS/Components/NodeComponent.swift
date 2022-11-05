import GameplayKit

enum NodeType: CaseIterable {
    case circle
    case floor
    case label
    case sprite
    case square
}

class NodeComponent: GKComponent {
    let node = TouchyNode()

    init(child: ChildNode) {
        node.addChild(child.asNode())
        super.init()
    }

    override func didAddToEntity() {
        node.entity = entity
        node.isUserInteractionEnabled = true
    }

    override func willRemoveFromEntity() {
        node.entity = nil
    }

    required init?(coder: NSCoder) { 
        fatalError()
    }
}
