import GameplayKit

class PositionComponent: GKComponent {
    var currentPosition: CGPoint

    init(position: CGPoint) {
        self.currentPosition = position
        super.init()
    }

    override func didAddToEntity() {
        super.didAddToEntity()
        guard let entity,
              let nodeComponent = entity.component(ofType: NodeComponent.self)
        else { return }
        nodeComponent.node.position = currentPosition
    }

    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}
