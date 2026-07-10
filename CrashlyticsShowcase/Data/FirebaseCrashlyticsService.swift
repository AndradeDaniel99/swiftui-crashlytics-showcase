import FirebaseCrashlytics
import Foundation

@MainActor
final class FirebaseCrashlyticsService: ObservabilityService {
    private let crashlytics = Crashlytics.crashlytics()

    func log(_ message: String) {
        crashlytics.log(message)
    }

    func setCustomValue(_ value: String, forKey key: String) {
        crashlytics.setCustomValue(value, forKey: key)
    }

    func setUserID(_ identifier: String?) {
        crashlytics.setUserID(identifier)
    }

    func record(_ error: any Error, context: String) {
        crashlytics.record(error: error, userInfo: ["context": context])
    }
}
