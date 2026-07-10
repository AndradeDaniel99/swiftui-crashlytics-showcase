import FirebaseCore
import UIKit

final class FirebaseAppDelegate: NSObject, UIApplicationDelegate {
    private(set) var isFirebaseConfigured = false

    func application(
        _ application: UIApplication,
        didFinishLaunchingWithOptions launchOptions: [UIApplication.LaunchOptionsKey: Any]? = nil
    ) -> Bool {
        guard Bundle.main.path(forResource: "GoogleService-Info", ofType: "plist") != nil else {
            return true
        }

        FirebaseApp.configure()
        isFirebaseConfigured = true
        return true
    }
}
