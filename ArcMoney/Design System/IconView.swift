//
//  IconView.swift
//  ArcMoney
//
//  Created by Matheus Vaccaro on 10/28/24.
//

import SwiftUI

// MARK: - IconView

struct IconView: View {
    
    // MARK: Internal Properties
    
    let icon: ArcMoneyIcon
    let size: ArcMoneySize
    let color: Color
    
    // MARK: Lifecycle
    
    init(icon: ArcMoneyIcon, size: ArcMoneySize = .medium, color: Color = .primary) {
        self.icon = icon
        self.size = size
        self.color = color
    }
    
    // MARK: Body
    
    var body: some View {
        icon.image
            .resizable()
            .aspectRatio(contentMode: .fit)
            .frame(
                width: size.rawValue,
                height: size.rawValue)
            .foregroundStyle(color)
    }
}

// MARK: - Preview

#Preview {
    VStack {
        HStack {
            Text("Small Icon:")
            IconView(icon: .salary, size: .small)
        }
        
        HStack {
            Text("Medium Icon:")
            IconView(icon: .salary, size: .medium)
        }
        
        HStack {
            Text("Large Icon:")
            IconView(icon: .salary, size: .large)
        }
    }
}
