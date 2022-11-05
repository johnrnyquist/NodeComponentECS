import UIKit
import SpriteKit

class GameViewController: UIViewController {
    override func viewDidLoad() {
        super.viewDidLoad()
        view.frame.size =  CGSize(width: 400, height: 500)
        let scene = GameScene(size: view.frame.size)
        scene.scaleMode = .aspectFit
        if let view = self.view as! SKView? {
            view.showsPhysics = true
            view.presentScene(scene)
        }
    }

    override var supportedInterfaceOrientations: UIInterfaceOrientationMask {
        if UIDevice.current.userInterfaceIdiom == .phone {
            return .allButUpsideDown
        } else {
            return .all
        }
    }
    override var prefersStatusBarHidden: Bool {
        return true
    }
}
