@testable import CrashlyticsShowcase

@MainActor
final class CrashTriggerSpy: CrashTrigger {
    private(set) var triggerCallCount = 0

    func trigger() {
        triggerCallCount += 1
    }
}
