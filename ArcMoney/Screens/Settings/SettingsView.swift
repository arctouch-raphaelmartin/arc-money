import SwiftUI

// MARK: - SettingsView

struct SettingsView: View {
    
    // MARK: Body
    
    var body: some View {
        Text("This is the Settings View")
    }
}

// MARK: - TabPresentable

extension SettingsView: TabPresentable {
    
    // MARK: Internal Properties
    
    var tabItem: some View {
        Label("Settings", systemImage: "gearshape")
    }

    var tabIdentifier: TabIdentifier {
        .settings
    }
}
