import SwiftUI

// MARK: - AppTabView

struct AppTabView: View {
    
    // MARK: Internal Properties
    
    @StateObject var tabState = TabState()
    
    @EnvironmentObject var tabManager: TabManager
    
    // MARK: Body
    
    var body: some View {
        TabView(selection: $tabState.selectedTab) {
            ForEach(tabManager.tabsFactory, id: \.id) { factory in
                 AnyView(
                    factory.makeTab()
                        .tabPresentable()
                )
            }
        }
        .environmentObject(tabState)
    }
}

// MARK: - Preview

#Preview {
    AppTabView()
        .environmentObject(TabManager())
}
