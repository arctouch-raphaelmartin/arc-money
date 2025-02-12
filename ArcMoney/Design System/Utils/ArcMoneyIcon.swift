import SwiftUI

// MARK: - ArcMoneyIcon

enum ArcMoneyIcon: String {
    
    // MARK: Cases
    
    case shopping = "cart.fill"
    case food = "fork.knife"
    case entertainment = "popcorn.fill"
    case transportation = "bus"
    case education = "graduationcap.fill"
    case healthcare = "stethoscope"
    case salary = "dollarsign"
    case investment = "chart.line.uptrend.xyaxis"
    case notification = "bell"
    case goBack = "arrow.left"
    case homeUnselected = "house"
    case homeSelected = "house.fill"
    case settingsUnselected = "gearshape"
    case settingsSelected = "gearshape.fill"
    case dropdownArrow = "chevron.down"
    case plus = "plus"
    case minus = "minus"
    case checkmark = "checkmark.circle.fill"
    
    // MARK: Internal Properties
    
    var image: Image {
        Image(systemName: self.rawValue)
    }
}
