import GameplayKit

class ContactSystem: GKComponentSystem<GKComponent> {
    override func update(deltaTime seconds: TimeInterval) {
        for case let component as ContactComponent in components {
            for entity in component.targetEntities {
                entity.component(ofType: ScaleComponent.self)?.targetScale = 1
//                guard let body = entity.component(ofType: PhysicsComponent.self)?.body
//                else {
//                    continue
//                }
//                switch body.categoryBitMask {
//                    case PhysicsCategory.square:
//                        body.applyImpulse(CGVector(dx: 5, dy: 5))
//                    case PhysicsCategory.circle:
//                        entity.component(ofType: NodeComponent.self)?.node.removeFromParent()
//                    default:
//                        break
//                }
            }
            component.targetEntities.removeAll()
        }
    }
}
