import SwiftUI

// MARK: - AppTabView

struct AppTabView: View {
    
    // MARK: Internal Properties
    
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
    }
}

// MARK: - Preview

#Preview {
    AppTabView()
}
