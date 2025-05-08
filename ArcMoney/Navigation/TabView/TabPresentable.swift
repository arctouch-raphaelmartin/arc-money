import SwiftUI

// MARK: - TabPresentable

protocol TabPresentable {
    
    // MARK: Associated Types
    
    associatedtype TabLabel: View
    
    // MARK: Internal Properties
    
    var tabItem: TabLabel { get }
    var tabIdentifier: TabIdentifier { get }
    
}

// MARK: - View + TabPresentable

extension View where Self: TabPresentable {
    
    // MARK: Internal Methods
    
    func tabPresentable() -> some View {
        self.tabItem {
            self.tabItem
        }
        .tag(self.tabIdentifier)
    }
}
