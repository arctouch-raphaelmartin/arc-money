import Foundation

// MARK: - ArcMoneyCornerRadius

enum ArcMoneyCornerRadius: CGFloat {
    
    // MARK: Cases
    
    /// 0 pts of radius.
    case none = 0
    /// 4 pts of radius.
    case quarter = 4
    /// 8 pts of radius.
    case half = 8
    /// 12 pts of radius.
    case threeQuarters = 12
    /// 16 pts of radius.
    case one = 16
    /// 20 pts of radius.
    case oneAndQuarter = 20
    /// 32 pts of radius.
    case two = 32
    /// Full radius. Creates a circle-like corner radii.
    case fullCircle = -1
    /// Full radius. Creates a capsule-like corner radii.
    case fullCapsule = -2
}
