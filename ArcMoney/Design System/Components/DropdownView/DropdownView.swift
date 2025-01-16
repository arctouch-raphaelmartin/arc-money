import SwiftUI

// MARK: - DropdownDirection

enum DropdownDirection {
    
    // MARK: Cases
    
    case top
    case bottom
}

// MARK: - DropdownView

struct DropdownView: View {
    
    // MARK: Internal Properties

    @Binding var selection: String?
    var options: [String]
    
    var dropdownDirection: DropdownDirection = .top
    
    // MARK: Private Properties
    
    @State private var showDropdown = false
    
    private let backgroundColor: Color = .white
    
    // zIndexes are being handled to support multiple DropdownViews being presented in the same View.
    // Without this, multiple menus will overlap themselves if they're opened at the same time.
    // These indexes ensure that the last menu that was opened always stays on top.
    @SceneStorage("drop_down_zindex") private var index = 1000.0
    @State private var zIndex = 1000.0
    
    // MARK: Lifecycle
    
    init(selection: Binding<String?>, options: [String], dropdownDirection: DropdownDirection = .top) {
        self._selection = selection
        self.options = options
        self.dropdownDirection = dropdownDirection
    }
    
    // MARK: Internal Methods
    
    func OptionsView() -> some View {
        VStack(spacing: 0) {
            ForEach(options, id: \.self) { option in
                let trailingIcon: ArcMoneyIcon? = (selection == option ? .checkmark : nil)
                DropdownRowView(
                    leadingIcon: .shopping,
                    title: option,
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
        .background(backgroundColor)
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
                    leadingIcon: .settingsSelected,
                    title: selection ?? "Select",
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
    }
}

// MARK: - Preview

#Preview {
    struct Preview: View {
        @State var selection: String? = "Option 1"
        var options: [String] = [
            "Option 1",
            "Option 2",
            "Option 3"
        ]
        
        var body: some View {
            DropdownView(selection: $selection, options: options, dropdownDirection: .bottom)
                .padding(.oneAndThreeQuarters)
                .background(.gray)
        }
    }
    
    return Preview()
}
