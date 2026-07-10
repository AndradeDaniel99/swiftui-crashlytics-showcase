import Observation

@MainActor
@Observable
final class DiagnosticsViewModel {
    private let observability: any ObservabilityService
    private let crashTrigger: any CrashTrigger

    let isFirebaseConfigured: Bool
    var statusMessage: String
    var isShowingCrashConfirmation = false

    init(
        observability: any ObservabilityService,
        crashTrigger: any CrashTrigger,
        isFirebaseConfigured: Bool
    ) {
        self.observability = observability
        self.crashTrigger = crashTrigger
        self.isFirebaseConfigured = isFirebaseConfigured
        statusMessage = isFirebaseConfigured
            ? "Firebase is configured. Events will be sent to Crashlytics."
            : "Firebase is not configured. Events are printed to the Xcode console."
    }

    func recordSampleEvent() {
        observability.setCustomValue("diagnostics", forKey: "screen")
        observability.setCustomValue("sample_event", forKey: "event_name")
        observability.setUserID("showcase-user")
        observability.log("Sample event recorded from Diagnostics screen.")
        statusMessage = "Sample event recorded."
    }

    func recordSampleError() {
        observability.setCustomValue("sample_error", forKey: "event_name")
        observability.record(DiagnosticError.sampleNetworkFailure, context: "Diagnostics screen")
        statusMessage = "Non-fatal error recorded."
    }

    func requestTestCrash() {
        #if DEBUG
        isShowingCrashConfirmation = true
        #else
        statusMessage = "Test crashes are available only in Debug builds."
        #endif
    }

    func triggerConfirmedTestCrash() {
        observability.log("Intentional test crash requested.")
        crashTrigger.trigger()
    }
}
