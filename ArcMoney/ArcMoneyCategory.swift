import SwiftUI

// MARK: - ArcMoneyCategory

enum ArcMoneyCategory: DropdownData {
    
    // MARK: Cases
    
    case education
    case food
    case entertainment
    case healthcare
    case salary
    
    // MARK: Internal Properties
    
    var title: String {
        switch self {
        case .education:
            "Education"
        case .food:
            "Food"
        case .entertainment:
            "Entertainment"
        case .healthcare:
            "Healthcare"
        case .salary:
            "salary"
        }
    }
    
    var icon: ArcMoneyIcon {
        switch self {
        case .education:
            .education
        case .food:
            .food
        case .entertainment:
            .entertainment
        case .healthcare:
            .healthcare
        case .salary:
            .salary
        }
    }
    
    var color: Color {
        .black // TODO: Placeholder color until we decide what to do.
    }
    
    var backgroundColor: Color {
        .red // TODO: Placeholder color until we decide what to do.
    }
}
