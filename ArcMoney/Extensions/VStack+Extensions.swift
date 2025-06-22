import SwiftUI

// MARK: - VStack Extensions

extension VStack {
    
    // MARK: Init
    
    init(alignment: HorizontalAlignment = .center, spacing: ArcMoneySpacing, @ViewBuilder content: () -> Content) {
        self.init(alignment: alignment, spacing: spacing.rawValue, content: content)
    }
}

// MARK: - LazyVStack Extensions

extension LazyVStack {
    
    // MARK: Init
    
    init(alignment: HorizontalAlignment = .center, spacing: ArcMoneySpacing, @ViewBuilder content: () -> Content) {
        self.init(alignment: alignment, spacing: spacing.rawValue, content: content)
    }
}
