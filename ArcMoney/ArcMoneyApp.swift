import SwiftUI

// MARK: - ArcMoneyApp

@main
struct ArcMoneyApp: App {
    
    // MARK: Body
    
    @StateObject
    private var tabManager = TabManager()
    
    var body: some Scene {
        WindowGroup {
            AppTabView()
                .environmentObject(tabManager)
        }
    }
}
