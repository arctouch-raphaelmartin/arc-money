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
    
    // zIndexes are being handled to support multiple DropdownViews being presented in the same View.
    // Without this, multiple menus will overlap themselves if they're opened at the same time.
    // These indexes ensure that the last menu that was opened always stays on top.
    @SceneStorage("drop_down_zindex") private var index = 1000.0
    @State private var zIndex = 1000.0
    
    private static let defaultUnselectedOption: DropdownData = .init(
        icon: .settingsUnselected,
        title: "Select")
    
    // MARK: Lifecycle
    
    init(
        selection: Binding<DropdownData?>,
        options: [DropdownData],
        dropdownDirection: DropdownDirection = .top,
        maxOptionsHeight: CGFloat = 200,
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
    
    func OptionsView() -> some View {
        ScrollView(.vertical) {
            VStack(spacing: 0) {
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
        }
        .frame(maxHeight: 200)
        .background(backgroundColor)
        .background(.green)
        .transition(.move(edge: dropdownDirection == .top ? .bottom : .top)) // This transition is making the option list slide from the back of the dropdown instead of fading in
        .zIndex(1)
    }
    
    // MARK: Body
    
    var body: some View {
        GeometryReader {
            let size = $0.size
            
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
                    index += 1
                    zIndex = index
                    withAnimation(.smooth) {
                        showDropdown.toggle()
                    }
                }
                .zIndex(10) // The higher zIndex ensures that the selected dropdown option is always in front of the option list. Specially important during the options opening/closing animation
            
                if dropdownDirection == .bottom && showDropdown {
                    OptionsView()
                }
            }
            .clipped() // Prevents the options from expanding outside the dropdown area when its collapsed.
            .cornerRadius(.one)
            .frame(height: size.height, alignment: dropdownDirection == .top ? .bottom : .top) // The alignment makes the options expand from the view, instead of the view relocate itself to show the options
        }
        .zIndex(zIndex)
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
        var options: [DropdownData] = [
            .init(icon: .education, title: "Education"),
            .init(icon: .food, title: "Food"),
            .init(icon: .entertainment, title: "Entertainment"),
            .init(icon: .healthcare, title: "Healthcare"),
            .init(icon: .salary, title: "Salary")
        ]
        
        var body: some View {
            DropdownView(
                selection: $selection,
                options: options,
                dropdownDirection: .bottom)
            .padding(.oneAndThreeQuarters)
            .background(.gray)
            
            DropdownView(
                selection: $selection,
                options: options,
                dropdownDirection: .top)
            .padding(.oneAndThreeQuarters)
            .background(.gray)
        }
    }
    
    return Preview()
}
