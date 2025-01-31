import SwiftUI

// MARK: - DropdownView

struct DropdownView: View {
    
    // MARK: Internal Properties

    @Binding var selection: DropdownData?
    
    var options: [DropdownData]
    var dropdownDirection: DropdownDirection = .top
    
    // MARK: Private Properties
    
    private let maxOptionsHeight: CGFloat
    private let backgroundColor: Color
    private let unselectedOption: DropdownData
    
    @State private var showDropdown = false
    
    private static let defaultUnselectedOption: DropdownData = .init(
        icon: .settingsUnselected,
        title: "Select")
    
    /// The default value used for configuring the maximum size of the options dropdown. A single row has 72pts of height. This property shows the equivalent of 3.5 rows (72pts * 3.5 rows = 252pts).
    private static let defaultMaxOptionsHeight: CGFloat = 252
    
    // MARK: Lifecycle
    
    init(
        selection: Binding<DropdownData?>,
        options: [DropdownData],
        dropdownDirection: DropdownDirection = .top,
        maxOptionsHeight: CGFloat = defaultMaxOptionsHeight,
        backgroundColor: Color = .white,
        unselectedOption: DropdownData = defaultUnselectedOption)
    {
        self._selection = selection
        self.options = options
        self.dropdownDirection = dropdownDirection
        self.maxOptionsHeight = maxOptionsHeight
        self.backgroundColor = backgroundColor
        self.unselectedOption = unselectedOption
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
            .overlay(GeometryReader { geometryProxy in
                Color.clear.onAppear {
                    withAnimation(.smooth) {
                        scrollViewContentSize = geometryProxy.size
                    }
                }
            })
        }
        .frame(height: min(scrollViewContentSize.height, maxOptionsHeight))
        .background(backgroundColor)
        .transition(.move(edge: dropdownDirection == .top ? .bottom : .top)) // This transition is making the option list slide from the back of the dropdown instead of fading in
    }

    
    // MARK: Body
    
    var body: some View {
        VStack(spacing: 0) {
            if dropdownDirection == .top && showDropdown {
                OptionsView()
            }
            
            DropdownRowView(
                leadingIcon: selection?.icon ?? unselectedOption.icon,
                title: selection?.title ?? unselectedOption.title,
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
            .zIndex(10) // The higher zIndex ensures that the selected dropdown option is always in front of the option list. Specially important during the options opening/closing animation.

            if dropdownDirection == .bottom && showDropdown {
                OptionsView()
            }
        }
        .clipped() // Prevents the options from expanding outside the dropdown area when its collapsed.
        .cornerRadius(.one)
        .frame(alignment: dropdownDirection == .top ? .bottom : .top) // The alignment makes the options expand from the view, instead of the view relocate itself to show the options
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
        @State var selection: DropdownData? = nil
        
        var multipleOptions: [DropdownData] = [
            .init(icon: .education, title: "Education"),
            .init(icon: .food, title: "Food"),
            .init(icon: .entertainment, title: "Entertainment"),
            .init(icon: .healthcare, title: "Healthcare"),
            .init(icon: .salary, title: "Salary")
        ]
        
        var twoOptions: [DropdownData] = [
            .init(icon: .education, title: "Education"),
            .init(icon: .food, title: "Food")
        ]
        
        var body: some View {
            VStack(spacing: .none) {
                Text("Multiple Options")
                
                DropdownView(
                    selection: $selection,
                    options: multipleOptions,
                    dropdownDirection: .bottom)
                .padding(.one)
                .background(.gray)
                
                Text("Two Options")
                
                DropdownView(
                    selection: $selection,
                    options: twoOptions,
                    dropdownDirection: .top)
                .padding(.one)
                .background(.gray)
                
                Spacer()
            }
        }
    }
    
    return Preview()
}
