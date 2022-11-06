import SpriteKit

class TouchyNode: SKNode {
    override func touchesBegan(_ touches: Set<UITouch>, with event: UIEvent?) {
        guard let t = touches.first,
              let scene = scene,
              let entity,
              let physicsComponent = entity.component(ofType: PhysicsComponent.self),
              let positionComponent = entity.component(ofType: PositionComponent.self)
        else { return }
        physicsComponent.position = t.location(in: scene)
        positionComponent.currentPosition = t.location(in: scene)
    }

    override func touchesMoved(_ touches: Set<UITouch>, with event: UIEvent?) {
        guard let t = touches.first,
              let scene = scene,
              let entity,
              let positionComponent = entity.component(ofType: PositionComponent.self)
        else { return }
        positionComponent.currentPosition = t.location(in: scene)
        // physics
        guard let physicsComponent = entity.component(ofType: PhysicsComponent.self)
        else { return }
        physicsComponent.position = t.location(in: scene)
    }

    override func touchesEnded(_ touches: Set<UITouch>, with event: UIEvent?) {
        guard let t = touches.first,
              let scene = scene,
              let entity,
              let physicsComponent = entity.component(ofType: PhysicsComponent.self),
              let positionComponent = entity.component(ofType: PositionComponent.self)
        else { return }
        physicsComponent.position = nil
        positionComponent.currentPosition = t.location(in: scene)
    }
}
