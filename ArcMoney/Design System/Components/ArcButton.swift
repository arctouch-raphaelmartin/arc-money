// ArcMoney

import SwiftUI

struct ArcButton: View {
    
    // MARK: internal properties
    let title: String
    let textColor: Color = .white
    let backgroundColor: Color = .primary
    let action: () -> Void
    
    // MARK: private properties
    private let buttonHeight: CGFloat = 72
    private let buttonCornerRadius: ArcMoneyCornerRadius = .oneAndQuarter
    
    // MARK: body
    var body: some View {
        Button(action: action) {
            Text(title)
                .textStyle(.h2)
                .foregroundColor(textColor)
                .frame(maxWidth: .infinity, maxHeight: buttonHeight)
                .background(backgroundColor)
                .cornerRadius(buttonCornerRadius)
        }
    }
}

#Preview {
    HStack {
        ArcButton(title: "Save") {
            print("Save button pressed")
        }
    }
}
