import SwiftUI

// MARK: - DropdownViewDefaultValue

/// A Struct containing the default configuration values used by `DropdownView`.
/// `DropdownView` expects a generic type, which prevents us from defining static properties. Hence why this separate configuration struct exists.
private struct DropdownViewDefaultValue {
    
    // MARK: Internal Properties
    
    /// The default value used for configuring the maximum size of the options dropdown. A single row has 72pts of height. This property shows the equivalent of 3.5 rows (72pts * 3.5 rows = 252pts).
    static let maxOptionsHeight: CGFloat = 252
    
    // MARK: Lifecycle
    
    private init() {
        // Prevent this struct from being initialized.
    }
}

// MARK: - DropdownViewDefaultData

/// A Struct containing default implementations of the generic type used by `DropdownView`.
/// `DropdownView` expects a generic type, which prevents us from defining static properties. Hence why this separate configuration struct exists.
private struct DropdownViewDefaultData: DropdownData {
    
    // MARK: Internal Properties
    
    static let unselectedOption = Self(icon: .settingsUnselected, title: "Select")
    
    var icon: ArcMoneyIcon
    var title: String
    
    // MARK: Lifecycle
    
    private init(icon: ArcMoneyIcon, title: String) {
        self.icon = icon
        self.title = title
    }
}

// MARK: - DropdownView

struct DropdownView<DropdownOption: DropdownData>: View {
    
    // MARK: Internal Properties
    
    @Binding var selection: DropdownOption?
    
    var options: [DropdownOption]
    
    // MARK: Private Properties
    
    private let maxOptionsHeight: CGFloat
    private let backgroundColor: Color
    private let unselectedOption: DropdownOption?
    
    @State private var showDropdown = false
    
    private let defaultUnselectedOption: any DropdownData = DropdownViewDefaultData.unselectedOption
    private let defaultMaxOptionsHeight: CGFloat = DropdownViewDefaultValue.maxOptionsHeight
    
    // MARK: Lifecycle
    
    init(
        selection: Binding<DropdownOption?>,
        options: [DropdownOption],
        backgroundColor: Color = .white,
        overrideMaxOptionsHeight: CGFloat? = nil,
        overrideUnselectedOption: DropdownOption? = nil)
    {
        self._selection = selection
        self.options = options
        self.backgroundColor = backgroundColor
        self.maxOptionsHeight = overrideMaxOptionsHeight ?? defaultMaxOptionsHeight
        self.unselectedOption = overrideUnselectedOption
    }
    
    // MARK: Internal Methods
    
    @State private var scrollViewContentSize: CGSize = .zero
    
    func OptionsView() -> some View {
        ScrollView(.vertical) {
            LazyVStack(spacing: 0) {
                ForEach(options, id: \.self) { option in
                    let trailingIcon: ArcMoneyIcon? = (selection == option ? .checkmark : nil)
                    DropdownRowView(
                        leadingIcon: option.icon,
                        title: option.title,
                        backgroundColor: backgroundColor,
                        trailingIcon: trailingIcon)
                    .animation(.none, value: selection) // This animation is preventing a bounce animation in the options list
                    .onTapGesture {
                        withAnimation(.smooth) {
                            selection = option
                            showDropdown.toggle()
                        }
                    }
                }
            }
            .observeSizeChange($scrollViewContentSize, updateWithAnimation: .smooth)
        }
        .frame(height: min(scrollViewContentSize.height, maxOptionsHeight))
        .background(backgroundColor)
        .transition(.move(edge: .top)) // This transition is making the option list slide from the back of the dropdown instead of fading in.
    }
    
    
    // MARK: Body
    
    var body: some View {
        VStack(spacing: 0) {
            DropdownRowView(
                leadingIcon: selection?.icon ?? unselectedOption?.icon ?? defaultUnselectedOption.icon,
                title: selection?.title ?? unselectedOption?.title ?? defaultUnselectedOption.title,
                backgroundColor: backgroundColor,
                trailingContent: {
                    IconView(icon: .dropdownArrow)
                        .padding(.half)
                        .rotationEffect(.degrees((showDropdown ? -180 : 0)))
                })
            .onTapGesture {
                withAnimation(.smooth) {
                    showDropdown.toggle()
                }
            }
            .zIndex(1) // The higher zIndex ensures that the selected dropdown option is always in front of the option list. Specially important during the options opening/closing animation.
            
            if showDropdown {
                OptionsView()
            }
        }
        .clipped() // Prevents the options from expanding outside the dropdown area when its collapsed.
        .cornerRadius(.one)
        .frame(alignment: .top) // The alignment makes the options expand from the view, instead of the view relocate itself to show the options.
        .onAppear {
            UIScrollView.appearance().bounces = false
        }
        .onDisappear {
            UIScrollView.appearance().bounces = true
        }
    }
}

// MARK: - Preview

#Preview {
    struct Preview: View {
        @State var selection: ArcMoneyCategory? = nil
        
        var multipleOptions: [ArcMoneyCategory] = [
            .education,
            .food,
            .entertainment,
            .healthcare,
            .salary
        ]
        
        var twoOptions: [ArcMoneyCategory] = [
            .education,
            .food,
        ]
        
        var body: some View {
            VStack(spacing: .none) {
                Text("Multiple Options")
                
                DropdownView(
                    selection: $selection,
                    options: multipleOptions)
                .padding(.one)
                .background(.gray)
                
                Text("Two Options")
                
                DropdownView(
                    selection: $selection,
                    options: twoOptions)
                .padding(.one)
                .background(.gray)
                
                Spacer()
            }
        }
    }
    
    return Preview()
}
