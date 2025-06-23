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
      //  UserDefaults.standard.set(true, forKey: "shouldShowUpdateNotification")
        
        return true
    }
    func application(_ app: UIApplication, open url: URL, options: [UIApplication.OpenURLOptionsKey: Any] = [:]) -> Bool {
           guard let components = URLComponents(url: url, resolvingAgainstBaseURL: true),
                 components.scheme == "EarthC137",
                 components.host == "tab",
                 let tabIdentifier = components.path.split(separator: "/").last else {
               return false
           }
           
           if let tabBarController = window?.rootViewController as? UITabBarController {
               switch tabIdentifier {
               case "date":
                   tabBarController.selectedIndex = 1 // Segunda pestaña (CalendarView)
               case "pins":
                   tabBarController.selectedIndex = 2 // Tercera pestaña (PinsView)
               // Añade más casos según necesites
               default:
                   tabBarController.selectedIndex = 0
               }
               return true
           }
           
           return false
       }
}
