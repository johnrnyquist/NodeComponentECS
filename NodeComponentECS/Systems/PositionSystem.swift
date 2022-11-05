import SpriteKit
import GameplayKit

class PositionSystem: GKComponentSystem<GKComponent> {
    override func addComponent(_ component: GKComponent) {
        super.addComponent(component)
        guard let skNode = component.entity?.component(ofType: NodeComponent.self)?.node,
              let component = component as? PositionComponent
        else { return }
        skNode.position = component.currentPosition
    }

    override func addComponent(foundIn entity: GKEntity) {
        super.addComponent(foundIn: entity)
    }
}
