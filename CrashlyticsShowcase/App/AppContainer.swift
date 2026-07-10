import Foundation

enum AppContainer {
    @MainActor
    static func makeDiagnosticsViewModel(isFirebaseConfigured: Bool) -> DiagnosticsViewModel {
        let observability: any ObservabilityService = if isFirebaseConfigured {
            FirebaseCrashlyticsService()
        } else {
            ConsoleObservabilityService()
        }

        return DiagnosticsViewModel(
            observability: observability,
            crashTrigger: DebugCrashTrigger(),
            isFirebaseConfigured: isFirebaseConfigured
        )
    }
}
