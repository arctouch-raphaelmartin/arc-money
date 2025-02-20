import SwiftUI

// MARK: - DropdownRowView

struct DropdownRowView<TrailingContent: View>: View {
    
    // MARK: Internal Properties
    
    let leadingIcon: ArcMoneyIcon
    let leadingIconColor: Color
    let leadingIconBackgroundColor: Color
    
    let title: String
    let backgroundColor: Color
    let cornerRadius: ArcMoneyCornerRadius
    
    let trailingIcon: ArcMoneyIcon?
    let trailingIconColor: Color?
    
    var trailingContent: () -> TrailingContent
    
    // MARK: Private Properties
    
    /// A helper constant designed to help provide a default placeholder background color for an icon, in case none is specified.
    /// The default background color will be based on the default `iconColor`.
    private let defaultBackcolorOpacity = 0.2
    
    // MARK: Lifecycle
    
    init(
        leadingIcon: ArcMoneyIcon,
        leadingIconColor: Color = .primary,
        leadingIconBackgroundColor: Color? = nil,
        title: String,
        backgroundColor: Color = .white,
        cornerRadius: ArcMoneyCornerRadius = .none,
        trailingIcon: ArcMoneyIcon? = nil,
        trailingIconColor: Color = .primary)
    where TrailingContent == EmptyView {
        self.init(
            leadingIcon: leadingIcon,
            leadingIconColor: leadingIconColor,
            leadingIconBackgroundColor: leadingIconBackgroundColor,
            title: title,
            backgroundColor: backgroundColor,
            cornerRadius: cornerRadius,
            trailingIcon: trailingIcon,
            trailingIconColor: trailingIconColor,
            trailingContent: { EmptyView() })
    }
    
    init(
        leadingIcon: ArcMoneyIcon,
        leadingIconColor: Color = .primary,
        leadingIconBackgroundColor: Color? = nil,
        title: String,
        backgroundColor: Color = .white,
        cornerRadius: ArcMoneyCornerRadius = .none,
        @ViewBuilder trailingContent: @escaping () -> TrailingContent)
    {
        self.init(
            leadingIcon: leadingIcon,
            leadingIconColor: leadingIconColor,
            leadingIconBackgroundColor: leadingIconBackgroundColor,
            title: title,
            backgroundColor: backgroundColor,
            cornerRadius: cornerRadius,
            trailingIcon: nil,
            trailingIconColor: nil,
            trailingContent: trailingContent)
    }
    
    private init(
        leadingIcon: ArcMoneyIcon,
        leadingIconColor: Color,
        leadingIconBackgroundColor: Color?,
        title: String,
        backgroundColor: Color,
        cornerRadius: ArcMoneyCornerRadius,
        trailingIcon: ArcMoneyIcon?,
        trailingIconColor: Color?,
        @ViewBuilder trailingContent: @escaping () -> TrailingContent)
    {
        self.leadingIcon = leadingIcon
        self.leadingIconColor = leadingIconColor
        self.leadingIconBackgroundColor = leadingIconBackgroundColor ?? leadingIconColor.opacity(defaultBackcolorOpacity)
        
        self.title = title
        self.backgroundColor = backgroundColor
        self.cornerRadius = cornerRadius
        
        self.trailingIcon = trailingIcon
        self.trailingIconColor = trailingIconColor
        self.trailingContent = trailingContent
    }
    
    // MARK: Body
    
    var body: some View {
        HStack {
            HStack(spacing: .one){
                BackgroundedIconView(
                    icon: leadingIcon,
                    size: .medium,
                    color: leadingIconColor,
                    iconPadding: .one,
                    backgroundColor: leadingIconBackgroundColor,
                    cornerRadius: .one)
                
                Text(title)
                    .textStyle(.h2)
            }
            .animation(.none, value: UUID()) // Workaround to continue using the deprecated `.animation(.none)` behavior.
            
            Spacer()
            
            if let trailingIcon, let trailingIconColor {
                IconView(
                    icon: trailingIcon,
                    size: .medium,
                    color: trailingIconColor)
                .padding(.half)
            } else {
                trailingContent()
                    .padding(.half)
            }
        }
        .padding(.half)
        .background(backgroundColor)
        .contentShape(Rectangle())
        .cornerRadius(cornerRadius)
    }
}

// MARK: - Preview

#Preview {
    VStack {
        DropdownRowView(
            leadingIcon: .shopping,
            title: "Shopping",
            trailingIcon: .dropdownArrow)
        
        DropdownRowView(
            leadingIcon: .shopping,
            title: "Shopping")
        
        DropdownRowView(
            leadingIcon: .shopping,
            title: "Shopping",
            trailingIcon: .checkmark)
        
        DropdownRowView(
            leadingIcon: .education,
            title: "Trailing Content",
            trailingContent: {
                Color.red
                    .frame(width: 40, height: 40)
            })
    }
    .padding(.oneAndThreeQuarters)
    .background(.gray)
}
