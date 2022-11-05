import SpriteKit
import GameplayKit

class ScaleSystem: GKComponentSystem<GKComponent> {
    override func update(deltaTime seconds: TimeInterval) {
        super.update(deltaTime: seconds)
//        components.compactMap { $0 as ScaleComponent }
//                  .filter { $0.doScale == false }
//                  .forEach { component in
//                      component.doScale = false
//                      guard let skNode = component.entity?.component(ofType: NodeComponent.self)?.node
//                      else { return }
//                      let distance = abs(component.target - skNode.xScale)
//                      let duration = TimeInterval(distance / component.scaleAmountPerSecond)
//                      let scaleActionKey = "scaleAction"
//                      skNode.removeAction(forKey: scaleActionKey)
//                      let action = SKAction.scale(to: component.targetScale, duration: duration)
//                      skNode.run(action, withKey: scaleActionKey)
//                  }
        for case let component as ScaleComponent in components {
            if component.doScale {
                component.doScale = false
                guard let skNode = component.entity?.component(ofType: NodeComponent.self)?.node
                else { return }
                let distance = abs(component.target - skNode.xScale)
                let duration = TimeInterval(distance / component.scaleAmountPerSecond)
                let scaleActionKey = "scaleAction"
                skNode.removeAction(forKey: scaleActionKey)
                let action = SKAction.scale(to: component.targetScale, duration: duration)
                skNode.run(action, withKey: scaleActionKey)
            }
        }
    }
}
