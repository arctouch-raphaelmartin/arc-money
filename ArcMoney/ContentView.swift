import SwiftUI

struct ContentView: View {
    @State var value: Double = 0.0
    
    var body: some View {
        VStack {
            Spacer()
            AmountView(value: $value)
            Spacer()
        }
        .padding()
        .background(.red)
        .unfocusOnTap()
    }
}

#Preview {
    ContentView()
}
