import SwiftUI

// MARK: - AppTabView

struct AppTabView: View {
    
    // MARK: Internal Properties
    
    let appSettingsManager = AppSettingsManager()
    
    @State var selectedTab: TabIdentifier = .home
    @StateObject var tabState = TabState()
    
    // MARK: Body
    
    var body: some View {
        TabView(selection: $tabState.selectedTab) {
            HomeView()
                .tabPresentable()
            
            StatisticsView()
                .tabPresentable()
            
            SettingsView()
                .tabPresentable()
        }
        .environmentObject(tabState)
        .environmentObject(appSettingsManager)
    }
}

// MARK: - Preview

#Preview {
    AppTabView()
}
