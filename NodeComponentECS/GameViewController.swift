import UIKit
import SpriteKit

class GameViewController: UIViewController {
    override func viewDidLoad() {
        super.viewDidLoad()
        let skview = SKView(frame: CGRect(x: 0, y: 0, width: 400, height: 700))
        view = skview
        let scene = GameScene(size: view.frame.size)
        scene.scaleMode = .aspectFit
        skview.presentScene(scene)
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
