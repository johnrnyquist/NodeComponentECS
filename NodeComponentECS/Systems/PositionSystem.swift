import SpriteKit
import GameplayKit

class PositionSystem: GKComponentSystem<GKComponent> {
    override func addComponent(_ component: GKComponent) {
        super.addComponent(component)
        guard
            let entity = component.entity,
            let nodeComponent = entity.component(ofType: NodeComponent.self),
            let positionComponent = component as? PositionComponent
        else { return }
        let node = nodeComponent.node
        node.position = positionComponent.currentPosition
    }

    override func addComponent(foundIn entity: GKEntity) {
        super.addComponent(foundIn: entity)
    }
}
