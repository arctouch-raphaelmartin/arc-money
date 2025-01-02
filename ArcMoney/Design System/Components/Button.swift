// ArcMoney

import SwiftUI

struct ArcButton: View {
    
    // MARK: internal properties
    let title: String
    let action: () -> Void
    private let buttonWidth: CGFloat = 72
    private let buttonCornerRadius: CGFloat = 20
    
    // MARK: body
    var body: some View {
        Button(action: action) {
            Text(title)
                .textStyle(.sectionTitle)
                .foregroundColor(.white)
                .padding()
                .frame(maxWidth: .infinity, maxHeight: buttonWidth)
                .background(Color.primary)
                .cornerRadius(buttonCornerRadius)
                .overlay(
                    RoundedRectangle(cornerRadius: buttonCornerRadius)
                        .stroke(Color.white, lineWidth: 2)
                )
        }.padding(.horizontal, 24)
    }
}

#Preview {
    HStack {
        ArcButton(title: "Save", action: {})
    }
}
