import SwiftUI

// MARK - AmountView

struct AmountView: View {
    
    // MARK: Internal Properties
    
    @Binding var value: Double
    let step: Double
    let currency: Currency
    
    // MARK: Private Properties
    
    @FocusState private var valueIsFocused
    
    // MARK: Lifecycle
    
    init(
        value: Binding<Double>,
        step: Double = 1.0,
        currency: Currency = .unitedStatesDollar)
    {
        self._value = value
        self.step = step
        self.currency = currency
    }
    
    // MARK: Auxiliary Components
    
    var minusStepper: some View {
        Button {
            value -= step
        } label: {
            BackgroundedIconView(
                icon: .minus,
                size: .medium,
                color: .primary,
                iconPadding: .one,
                backgroundColor: .light,
                cornerRadius: .one)
        }
    }
    
    var plusStepper: some View {
        Button {
            value += step
        } label: {
            BackgroundedIconView(
                icon: .plus,
                size: .medium,
                color: .primary,
                iconPadding: .one,
                backgroundColor: .light,
                cornerRadius: .one)
        }
    }
    
    // MARK: Body
    
    var body: some View {
        HStack {
            minusStepper
            
            Spacer()
            
            TextField("Value", value: $value, format: .currency(code: currency.isoCode))
            // TextField("Value", value: $value, formatter: currency.formatter)
            // Using `formatter` instead of `format` make UI not update if user deletes the "$".
                .textStyle(.h1)
                .multilineTextAlignment(.center)
                .keyboardType(.decimalPad)
                .focused($valueIsFocused) // Added but ended up not using because `decimalPad` and `numberPad` don't have a submit button :(
            
            Spacer()
            
            plusStepper
        }
        .padding(.half)
        .background(.white)
        .cornerRadius(.oneAndQuarter)
    }
}

// MARK: - Preview

#Preview {
    @Previewable @State var value: Double = 10
    
    VStack {
        Spacer()
        
        Text("Amount Component")
            .textStyle(.h1)
        
        Spacer()
        
        Text("Default: USD with 1.00 steps")
        
        AmountView(value: $value)
            .padding(.oneAndHalf)
        
        Spacer()
        
        Text("Alternate: BRL with 0.50 steps")
        
        AmountView(value: $value, step: 0.5, currency: .brazilianReal)
            .padding(.oneAndHalf)
        
        Spacer()
    }.background(Color.gray)
}
