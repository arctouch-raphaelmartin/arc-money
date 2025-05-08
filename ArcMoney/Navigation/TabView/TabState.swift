import Foundation

// MARK: - TabState

class TabState: ObservableObject {
    
    // MARK: Internal Properties
    
    @Published var selectedTab: TabIdentifier = .home
}

// MARK: - TabIdentifier

enum TabIdentifier: CaseIterable {
    
    // MARK: Cases
    
    case home
    case statistics
    case settings
}
