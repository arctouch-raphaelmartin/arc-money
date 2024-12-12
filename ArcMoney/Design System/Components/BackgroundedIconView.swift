import SwiftUI

// MARk: - BackgroundedIconView

struct BackgroundedIconView: View {
    
    // MARK: Internal Properties
    
    let icon: ArcMoneyIcon
    let size: ArcMoneySize
    let color: Color
    let iconPadding: ArcMoneySpacing
    let backgroundColor: Color
    let cornerRadius: ArcMoneyCornerRadius
    
    // MARK: Lifecycle
    
    init(
        icon: ArcMoneyIcon,
        size: ArcMoneySize = .medium,
        color: Color = .primary,
        iconPadding: ArcMoneySpacing = .one,
        backgroundColor: Color = .clear,
        cornerRadius: ArcMoneyCornerRadius = .none)
    {
        self.icon = icon
        self.size = size
        self.color = color
        self.iconPadding = iconPadding
        self.backgroundColor = backgroundColor
        self.cornerRadius = cornerRadius
    }
    
    // MARK: Body
    
    var body: some View {
        IconView(
            icon: icon,
            size: size,
            color: color)
        .padding(iconPadding)
        .background(backgroundColor)
        .cornerRadius(cornerRadius)
    }
}

// MARK: - Preview

#Preview {
    VStack {
        VStack {
            Text("Default:")
            
            HStack {
                BackgroundedIconView(icon: .salary)
                BackgroundedIconView(icon: .salary, backgroundColor: .secondary)
                BackgroundedIconView(icon: .salary, backgroundColor: .gray)
                BackgroundedIconView(icon: .salary, backgroundColor: .dark)
            }
        }
        
        Divider()
        
        VStack {
            Text("Corner Radius:")
            
            HStack {
                BackgroundedIconView(icon: .salary, cornerRadius: .one)
                BackgroundedIconView(icon: .salary, backgroundColor: .secondary, cornerRadius: .one)
                BackgroundedIconView(icon: .salary, backgroundColor: .gray, cornerRadius: .one)
                BackgroundedIconView(icon: .salary, backgroundColor: .dark, cornerRadius: .one)
            }
        }
        
        Divider()
        
        VStack {
            Text("Full Corner Radius:")
            
            HStack {
                BackgroundedIconView(icon: .salary, cornerRadius: .fullCircle)
                BackgroundedIconView(icon: .salary, backgroundColor: .secondary, cornerRadius: .fullCircle)
                BackgroundedIconView(icon: .salary, backgroundColor: .gray, cornerRadius: .fullCircle)
                BackgroundedIconView(icon: .salary, backgroundColor: .dark, cornerRadius: .fullCircle)
            }
        }
        
        Divider()
        
        VStack {
            Text("Larger Spacing & Corner Radius:")
            
            HStack {
                BackgroundedIconView(icon: .salary, iconPadding: .oneAndHalf, cornerRadius: .fullCircle)
                BackgroundedIconView(icon: .salary, iconPadding: .oneAndHalf, backgroundColor: .secondary, cornerRadius: .fullCircle)
                BackgroundedIconView(icon: .salary, iconPadding: .oneAndHalf, backgroundColor: .gray, cornerRadius: .fullCircle)
                BackgroundedIconView(icon: .salary, iconPadding: .oneAndHalf, backgroundColor: .dark, cornerRadius: .fullCircle)
            }
        }
    }
}
