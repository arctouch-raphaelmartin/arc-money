import SwiftUI

// MARK: - View Extensions

extension View {
    
    // MARK: Padding
    
    func padding(_ spacing: ArcMoneySpacing) -> some View {
        padding(spacing.rawValue)
    }
    
    func padding(_ edges: Edge.Set, _ spacing: ArcMoneySpacing) -> some View {
        padding(edges, spacing.rawValue)
    }
    
    // MARK: Corner Radius
    
    @ViewBuilder
    func cornerRadius(_ radius: ArcMoneyCornerRadius) -> some View {
        switch radius {
        case .none, .quarter, .one, .oneAndQuarter, .two:
            clipShape(RoundedRectangle(cornerRadius: radius.rawValue))
        case .fullCircle:
            clipShape(Circle())
        case .fullCapsule:
            clipShape(Capsule())
        }
    }
}
