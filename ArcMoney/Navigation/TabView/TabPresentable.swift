import SwiftUI

// MARK: - TabPresentable

protocol TabPresentable: View {
    
    // MARK: Associated Types
    
    associatedtype TabLabel: View
    
    // MARK: Internal Properties
    
    var tabItem: TabLabel { get }
    static var tabIdentifier: TabIdentifier { get }
    
}

// MARK: - View + TabPresentable

extension View where Self: TabPresentable {
    
    // MARK: Internal Methods
    
    func tabPresentable() -> some View {
        self.tabItem {
            self.tabItem
        }
        .tag(Self.tabIdentifier)
    }
}
