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
        switch self {
        case .education:
            .brown
        case .food:
            .orange
        case .entertainment:
            .red
        case .healthcare:
            .blue
        case .salary:
            .green
        }
    }
    
    var backgroundColor: Color {
        switch self {
        case .education:
            Color(red: 1, green: 0.95, blue: 1)
        case .food:
            Color(red: 0.95, green: 0.95, blue: 0.925)
        case .entertainment:
            Color(red: 1, green: 0.925, blue: 0.925)
        case .healthcare:
            Color(red: 0.925, green: 0.925, blue: 1)
        case .salary:
            Color(red: 0.925, green: 1, blue: 0.925)
        }
    }
}
