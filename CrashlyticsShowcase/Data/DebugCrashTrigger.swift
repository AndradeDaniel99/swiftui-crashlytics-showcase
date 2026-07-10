import Foundation

@MainActor
final class DebugCrashTrigger: CrashTrigger {
    func trigger() {
        #if DEBUG
        fatalError("Intentional Crashlytics showcase crash")
        #endif
    }
}
