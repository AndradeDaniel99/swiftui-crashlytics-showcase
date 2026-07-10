import Foundation
@testable import CrashlyticsShowcase

@MainActor
final class ObservabilityServiceSpy: ObservabilityService {
    private(set) var logs: [String] = []
    private(set) var customValues: [String: String] = [:]
    private(set) var userID: String?
    private(set) var recordedContext: String?

    func log(_ message: String) {
        logs.append(message)
    }

    func setCustomValue(_ value: String, forKey key: String) {
        customValues[key] = value
    }

    func setUserID(_ identifier: String?) {
        userID = identifier
    }

    func record(_ error: any Error, context: String) {
        recordedContext = context
    }
}
