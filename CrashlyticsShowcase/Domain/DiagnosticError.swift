import Foundation

enum DiagnosticError: LocalizedError {
    case sampleNetworkFailure

    var errorDescription: String? {
        switch self {
        case .sampleNetworkFailure:
            "Simulated network failure"
        }
    }
}
