import SwiftUI

// MARK: - SettingsView

struct SettingsView: View {
    
    // MARK: Private Properties
    
    @StateObject
    private var appSettingsManager = UserDefaultsAppSettingsManager()
//    private var appSettingsManager = InMemoryAppSettingsManager()
//    private var appSettingsManager = UserDefaultsAppSettingsManagerChatGPT()
    
    private var currencyCurrency: String {
        appSettingsManager.currency.isoCode
    }
    
    // MARK: Body
    
    var body: some View {
        VStack(spacing: .one) {
            Text("This is the Settings View")
            
            currencySelector
        }
    }
    
    // MARK: Auxiliary Views
    
    private var currencySelector: some View {
        VStack {
            Text("Current Currency: \(currencyCurrency)")
            
            HStack(spacing: .half) {
                Button {
                    appSettingsManager.currency = .unitedStatesDollar
                } label: {
                    Text("Set USD")
                }
                
                Button {
                    appSettingsManager.currency = .brazilianReal
                } label: {
                    Text("Set BRL")
                }
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
