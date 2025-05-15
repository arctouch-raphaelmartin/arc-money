import SwiftUI

// MARK: - SettingsView

struct SettingsView: View {
    
    // MARK: Private Properties
    
    @EnvironmentObject private var appSettingsManager: AppSettingsManager
    
    // MARK: Private Methods
    
    private func openAppSettings() {
        guard let url = URL(string: UIApplication.openSettingsURLString),
              UIApplication.shared.canOpenURL(url)
        else {
            return
        }
        
        UIApplication.shared.open(url)
    }
    
    // MARK: Body
    
    var body: some View {
        VStack(spacing: .one) {
            Text("This is the Settings View")
         
            Text("Selected Currency: \(appSettingsManager.currency.title)")
            
            Button("Open App Settings") {
                openAppSettings()
            }
        }
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
