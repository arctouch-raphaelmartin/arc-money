import SwiftUI

// MARK: - HStack Extensions

extension HStack {
    
    // MARK: Init
    
    init(alignment: VerticalAlignment = .center, spacing: ArcMoneySpacing, @ViewBuilder content: () -> Content) {
        self.init(alignment: alignment, spacing: spacing.rawValue, content: content)
    }
}
