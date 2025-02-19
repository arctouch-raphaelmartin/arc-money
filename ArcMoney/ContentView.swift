import SwiftUI

struct ContentView: View {
    @State var value: Double = 0.0
    
    var body: some View {
        VStack {
            AmountView(value: $value)
        }
        .padding()
    }
}

#Preview {
    ContentView()
}
