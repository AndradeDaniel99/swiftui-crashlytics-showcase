import SwiftUI

@main
struct CrashlyticsShowcaseApp: App {
    @UIApplicationDelegateAdaptor(FirebaseAppDelegate.self) private var appDelegate

    var body: some Scene {
        WindowGroup {
            DiagnosticsView(
                viewModel: AppContainer.makeDiagnosticsViewModel(
                    isFirebaseConfigured: appDelegate.isFirebaseConfigured
                )
            )
        }
    }
}
