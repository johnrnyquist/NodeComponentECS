//
// Created by John Nyquist on 11/5/22.
//

import GameplayKit

class NodeAndPhysicsSystem: GKComponentSystem<GKComponent> {
    override func update(deltaTime seconds: TimeInterval) {
        super.update(deltaTime: seconds)
        for case let _self as NodeComponent in components {
            if let physicsComponent = _self.entity?.component(ofType: PhysicsComponent.self) {
                guard let hasPhysicsPosition = physicsComponent.position else {
                    continue
                }
                let distance = CGVector(dx: hasPhysicsPosition.x - _self.node.position.x,
                                        dy: hasPhysicsPosition.y - _self.node.position.y)
                let velocity = CGVector(dx: distance.dx / CGFloat(seconds), dy: distance.dy / CGFloat(seconds))
                physicsComponent.body?.velocity = velocity
            } else {
                if let hasPos = _self.entity?.component(ofType: PositionComponent.self)?.currentPosition {
                    _self.node.position = hasPos
                }
            }
        }
    }
}


