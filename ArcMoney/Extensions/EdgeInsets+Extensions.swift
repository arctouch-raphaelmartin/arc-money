import SwiftUI

// MARK: - EdgeInsets Extensions

extension EdgeInsets {
    
    // MARK: Init
    
    init(
        top: ArcMoneySpacing = .zero,
        leading: ArcMoneySpacing = .zero,
        bottom: ArcMoneySpacing = .zero,
        trailing: ArcMoneySpacing = .zero)
    {
        self.init(
            top: top.rawValue,
            leading: leading.rawValue,
            bottom: bottom.rawValue,
            trailing: trailing.rawValue)
    }
}
