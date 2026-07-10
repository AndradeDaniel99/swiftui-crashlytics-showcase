import Testing
@testable import CrashlyticsShowcase

@MainActor
struct DiagnosticsViewModelTests {
    @Test func recordingSampleEventSendsExpectedDiagnostics() {
        let observability = ObservabilityServiceSpy()
        let viewModel = DiagnosticsViewModel(
            observability: observability,
            crashTrigger: CrashTriggerSpy(),
            isFirebaseConfigured: true
        )

        viewModel.recordSampleEvent()

        #expect(observability.customValues["screen"] == "diagnostics")
        #expect(observability.customValues["event_name"] == "sample_event")
        #expect(observability.userID == "showcase-user")
        #expect(observability.logs == ["Sample event recorded from Diagnostics screen."])
        #expect(viewModel.statusMessage == "Sample event recorded.")
    }

    @Test func recordingSampleErrorIncludesContext() {
        let observability = ObservabilityServiceSpy()
        let viewModel = DiagnosticsViewModel(
            observability: observability,
            crashTrigger: CrashTriggerSpy(),
            isFirebaseConfigured: false
        )

        viewModel.recordSampleError()

        #expect(observability.customValues["event_name"] == "sample_error")
        #expect(observability.recordedContext == "Diagnostics screen")
        #expect(viewModel.statusMessage == "Non-fatal error recorded.")
    }

    @Test func debugBuildRequestsConfirmationBeforeTestCrash() {
        let viewModel = DiagnosticsViewModel(
            observability: ObservabilityServiceSpy(),
            crashTrigger: CrashTriggerSpy(),
            isFirebaseConfigured: true
        )

        viewModel.requestTestCrash()

        #expect(viewModel.isShowingCrashConfirmation)
    }
}
