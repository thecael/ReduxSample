import UIKit
import ReSwift

let mainStore = Store<AppState>(
    reducer: AppReducer(),
    state: nil
)

@UIApplicationMain
class AppDelegate: UIResponder, UIApplicationDelegate {

    var window: UIWindow?

    func application(_ application: UIApplication,
                     didFinishLaunchingWithOptions launchOptions: [UIApplicationLaunchOptionsKey: Any]?) -> Bool {
        window = UIWindow.init(frame: UIScreen.main.bounds)
        window?.backgroundColor = UIColor.lightGray
        let mainViewController = ViewController()
        window?.rootViewController = mainViewController
        window?.makeKeyAndVisible()

        return true
    }
}
