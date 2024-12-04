//
//  View+Extensions.swift
//  ArcMoney
//
//  Created by Matheus Vaccaro on 11/26/24.
//

import SwiftUI

// MARK: - View Extensions

extension View {
    
    // MARK: Padding
    
    func padding(_ spacing: ArcMoneySpacing) -> some View {
        padding(spacing.rawValue)
    }
    
    // MARK: Corner Radius
    
    @ViewBuilder
    func cornerRadius(_ radius: ArcMoneyCornerRadius) -> some View {
        switch radius {
        case .none, .quarter, .half, .threeQuarters, .one, .oneAndQuarter, .oneAndHalf, .oneAndThreeQuarters, .two,
                .three, .four:
            clipShape(RoundedRectangle(cornerRadius: radius.rawValue))
        case .fullCircle:
            clipShape(Circle())
        case .fullCapsule:
            clipShape(Capsule())
        }
    }
}
