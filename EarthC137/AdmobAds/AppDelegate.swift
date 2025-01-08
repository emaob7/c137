import UIKit
import GoogleMobileAds
//import Firebase

//@main
class AppDelegate: UIResponder, UIApplicationDelegate {
    
    var window: UIWindow?

    func application(_ application: UIApplication,
                     didFinishLaunchingWithOptions launchOptions: [UIApplication.LaunchOptionsKey: Any]?) -> Bool {
        
        // Configurar Firebase
      //  FirebaseApp.configure()
        
        // Iniciar Google Mobile Ads
        GADMobileAds.sharedInstance().start(completionHandler: nil)
        
        
   

        
        
        return true
    }
}
