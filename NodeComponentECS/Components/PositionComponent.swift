import GameplayKit

class PositionComponent: GKComponent {
    var currentPosition: CGPoint

    init(pos: CGPoint) {
        currentPosition = pos
        super.init()
    }

    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}
