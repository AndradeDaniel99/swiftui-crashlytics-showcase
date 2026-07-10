import SwiftUI

struct DiagnosticsView: View {
    @State private var viewModel: DiagnosticsViewModel

    init(viewModel: DiagnosticsViewModel) {
        _viewModel = State(initialValue: viewModel)
    }

    var body: some View {
        NavigationStack {
            List {
                FirebaseStatusSection(isConfigured: viewModel.isFirebaseConfigured)

                Section("Send diagnostic data") {
                    Button("Record sample event", systemImage: "point.3.connected.trianglepath.dotted") {
                        viewModel.recordSampleEvent()
                    }

                    Button("Record non-fatal error", systemImage: "exclamationmark.triangle") {
                        viewModel.recordSampleError()
                    }
                }

                Section {
                    Button("Trigger test crash", systemImage: "bolt.trianglebadge.exclamationmark", action: viewModel.requestTestCrash)
                        .tint(.red)
                } header: {
                    Text("Test crash")
                } footer: {
                    Text("This action requires confirmation and is enabled only in Debug builds.")
                }

                Section("Last action") {
                    Text(viewModel.statusMessage)
                }
            }
            .navigationTitle("Diagnostics")
            .confirmationDialog(
                "Trigger an intentional crash?",
                isPresented: $viewModel.isShowingCrashConfirmation,
                titleVisibility: .visible
            ) {
                Button("Crash now", role: .destructive, action: viewModel.triggerConfirmedTestCrash)
                Button("Cancel", role: .cancel) {}
            } message: {
                Text("The app will close immediately. Reopen it to send the crash report.")
            }
        }
    }
}

#Preview {
    DiagnosticsView(
        viewModel: DiagnosticsViewModel(
            observability: ConsoleObservabilityService(),
            crashTrigger: DebugCrashTrigger(),
            isFirebaseConfigured: false
        )
    )
}
