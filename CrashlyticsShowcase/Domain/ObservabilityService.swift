import Foundation

@MainActor
protocol ObservabilityService {
    func log(_ message: String)
    func setCustomValue(_ value: String, forKey key: String)
    func setUserID(_ identifier: String?)
    func record(_ error: any Error, context: String)
}
