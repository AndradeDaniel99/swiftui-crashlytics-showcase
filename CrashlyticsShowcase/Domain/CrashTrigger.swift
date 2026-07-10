import Foundation

@MainActor
protocol CrashTrigger {
    func trigger()
}
