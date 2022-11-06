import SpriteKit
import GameplayKit

class PositionSystem: GKComponentSystem<GKComponent> {
    override func addComponent(_ component: GKComponent) {
        super.addComponent(component)
        guard let node = component.entity?.component(ofType: NodeComponent.self)?.node,
              let component = component as? PositionComponent
        else { return }
        node.position = component.currentPosition
    }

    override func addComponent(foundIn entity: GKEntity) {
        super.addComponent(foundIn: entity)
    }
}
