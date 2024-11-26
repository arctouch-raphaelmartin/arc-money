//
//  View+Extensions.swift
//  ArcMoney
//
//  Created by Matheus Vaccaro on 11/26/24.
//

import SwiftUI

// MARK: View Extensions

extension View {
    func padding(_ spacing: ArcMoneySpacing) -> some View {
        padding(spacing.rawValue)
    }
}
