import SpriteKit
import GameplayKit

class ScaleComponent: GKComponent {
    var scaleAmountPerSecond: CGFloat = 3
    var target: CGFloat = 1
    var doScale = false
}

extension ScaleComponent {
    var targetScale: CGFloat {
        get { target }
        set {
            target = newValue
            doScale = true
            guard let skNode = entity?.component(ofType: NodeComponent.self)?.node
            else { return }
            let distance = abs(target - skNode.xScale)
            let duration = TimeInterval(distance / scaleAmountPerSecond)
            let scaleActionKey = "scaleAction"
            skNode.removeAction(forKey: scaleActionKey)
            let action = SKAction.scale(to: targetScale, duration: duration)
            skNode.run(action, withKey: scaleActionKey)
        }
    }
}
