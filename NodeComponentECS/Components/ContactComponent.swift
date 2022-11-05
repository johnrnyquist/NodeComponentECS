import GameplayKit

class ContactComponent: GKComponent {
    var targetEntities: [GKEntity] = []

    func didMakeContact(with entity: GKEntity?) {
        guard let entity else { return }
        targetEntities.append(entity)
    }
}
