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
            IconView(icon: .salary, size: .small, color: .light)
            IconView(icon: .salary, size: .small, color: .dark)
            IconView(icon: .salary, size: .small, color: .primary)
            IconView(icon: .salary, size: .small, color: .secondary)
        }
        
        HStack {
            Text("Medium Icon:")
            
            IconView(icon: .salary, size: .medium)
            IconView(icon: .salary, size: .medium, color: .light)
            IconView(icon: .salary, size: .medium, color: .dark)
            IconView(icon: .salary, size: .medium, color: .primary)
            IconView(icon: .salary, size: .medium, color: .secondary)
        }
        
        HStack {
            Text("Large Icon:")
            
            IconView(icon: .salary, size: .large)
            IconView(icon: .salary, size: .large, color: .light)
            IconView(icon: .salary, size: .large, color: .dark)
            IconView(icon: .salary, size: .large, color: .primary)
            IconView(icon: .salary, size: .large, color: .secondary)
        }
    }
}
