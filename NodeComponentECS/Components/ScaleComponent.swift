import SpriteKit
import GameplayKit

class ScaleComponent: GKComponent {
    var scaleAmountPerSecond: CGFloat = 1.5
    private var target: CGFloat = 1
}

extension ScaleComponent {
    var targetScale: CGFloat {
        get { target }
        set {
            target = newValue
            guard let skNode = entity?.component(ofType: NodeComponent.self)?.node
            else { return }
            let distance = abs(target - skNode.xScale)
            let duration = TimeInterval(distance / scaleAmountPerSecond)
            skNode.removeAction(forKey: "scaleAction")
            let action = SKAction.scale(to: targetScale, duration: duration)
            skNode.run(action)
        }
    }
}
