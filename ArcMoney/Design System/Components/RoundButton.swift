import SwiftUI

// MARK: - RoundButton

struct RoundButton: View {
    
    // MARK: Internal Properties
    
    let icon: ArcMoneyIcon
    let iconSize: ArcMoneySize
    let iconColor: Color
    let iconPadding: ArcMoneySpacing
    let backgroundColor: Color
    let action: () -> Void
    
    // MARK: Lifecycle
    
    init(
        icon: ArcMoneyIcon,
        iconSize: ArcMoneySize = .small,
        iconColor: Color = .primary,
        iconPadding: ArcMoneySpacing = .threeQuarters,
        backgroundColor: Color = .white,
        action: @escaping () -> Void)
    {
        self.icon = icon
        self.iconSize = iconSize
        self.iconColor = iconColor
        self.iconPadding = iconPadding
        self.backgroundColor = backgroundColor
        self.action = action
    }
    
    // MARK: Body
    
    var body: some View {
        Button(action: action) {
            BackgroundedIconView(
                icon: icon,
                size: iconSize,
                color: iconColor,
                iconPadding: iconPadding,
                backgroundColor: backgroundColor,
                cornerRadius: .fullCircle)
        }
    }
}

// MARK: - Preview

#Preview {
    VStack {
        Spacer()
        
        Text("RoundButton Component")
            .textStyle(.h1)
        
        Spacer()
        
        VStack {
            Text("Small Icon")
                .textStyle(.h2)
            
            HStack {
                Spacer()
                
                VStack {
                    Text("Default")
                    
                    RoundButton(icon: .checkmark) {
                        print("Tap")
                    }
                }
                
                Spacer()
                
                VStack {
                    Text("Backgrounded")
                    
                    RoundButton(icon: .checkmark, backgroundColor: .secondary) {
                        print("Tap")
                    }
                }
                
                Spacer()
            }
        }
        
        Spacer()
        
        VStack {
            Text("Medium Icon")
                .textStyle(.h2)
            
            HStack {
                Spacer()
                
                VStack {
                    Text("Default")
                    
                    RoundButton(icon: .checkmark, iconSize: .medium) {
                        print("Tap")
                    }
                }
                
                Spacer()
                
                VStack {
                    Text("Backgrounded")
                    
                    RoundButton(icon: .checkmark, iconSize: .medium, backgroundColor: .secondary) {
                        print("Tap")
                    }
                }
                
                Spacer()
            }
        }
        
        Spacer()
        
        VStack {
            Text("Large Icon")
                .textStyle(.h2)
            
            HStack {
                Spacer()
                
                VStack {
                    Text("Default")
                    
                    RoundButton(icon: .checkmark, iconSize: .large) {
                        print("Tap")
                    }
                }
                
                Spacer()
                
                VStack {
                    Text("Backgrounded")
                    
                    RoundButton(icon: .checkmark, iconSize: .large, backgroundColor: .secondary) {
                        print("Tap")
                    }
                }
                
                Spacer()
            }
        }
        
        Spacer()
        
        VStack {
            Text("Variable Padding")
                .textStyle(.h2)
            
            HStack {
                Spacer()
                
                VStack {
                    Text("Zero")
                    
                    RoundButton(
                        icon: .checkmark,
                        iconSize: .medium,
                        iconPadding: .zero,
                        backgroundColor: .secondary)
                    {
                        print("Tap")
                    }
                }
                
                Spacer()
                
                VStack {
                    Text("Zero")
                    
                    RoundButton(
                        icon: .checkmark,
                        iconSize: .medium,
                        iconPadding: .half,
                        backgroundColor: .secondary)
                    {
                        print("Tap")
                    }
                }
                
                Spacer()
                
                VStack {
                    Text("One")
                    
                    RoundButton(
                        icon: .checkmark,
                        iconSize: .medium,
                        iconPadding: .one,
                        backgroundColor: .secondary)
                    {
                        print("Tap")
                    }
                }
                
                Spacer()
            }
        }
        
        Spacer()
    }.background(Color.gray)
}
