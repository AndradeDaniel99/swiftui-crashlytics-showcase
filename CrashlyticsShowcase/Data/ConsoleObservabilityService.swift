import Foundation

@MainActor
final class ConsoleObservabilityService: ObservabilityService {
    func log(_ message: String) {
        print("[Observability] \(message)")
    }

    func setCustomValue(_ value: String, forKey key: String) {
        print("[Observability] \(key): \(value)")
    }

    func setUserID(_ identifier: String?) {
        print("[Observability] userID: \(identifier ?? "nil")")
    }

    func record(_ error: any Error, context: String) {
        print("[Observability] \(context): \(error.localizedDescription)")
    }
}
