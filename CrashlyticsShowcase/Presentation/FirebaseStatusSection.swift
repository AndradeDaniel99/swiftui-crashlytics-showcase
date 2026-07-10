import SwiftUI

struct FirebaseStatusSection: View {
    let isConfigured: Bool

    var body: some View {
        Section {
            Label {
                Text(isConfigured ? "Crashlytics is configured" : "Local console fallback")
            } icon: {
                Image(systemName: isConfigured ? "checkmark.circle.fill" : "info.circle.fill")
                    .foregroundStyle(isConfigured ? .green : .orange)
            }
        } header: {
            Text("Firebase")
        } footer: {
            Text(isConfigured ? "Logs and errors will be sent to Firebase." : "Add GoogleService-Info.plist to enable Firebase.")
        }
    }
}
