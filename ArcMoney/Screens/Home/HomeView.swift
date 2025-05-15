import SwiftUI

// MARK: - HomeView

struct HomeView: View {
    
    // MARK: Internal Properties
    
    @EnvironmentObject var tabState: TabState
    
    // MARK: Body
    
    var body: some View {
        VStack(spacing: .one) {
            Text("This is the Home View")
            
            Button("Go to Settings") {
                tabState.selectedTab = .settings
            }
        }
    }
}

// MARK: - TabPresentable

extension HomeView: TabPresentable {
    
    // MARK: Internal Properties
    
    var tabItem: some View {
        Label("Home", systemImage: "house")
    }
    
    var tabIdentifier: TabIdentifier {
        .home
    }
}
