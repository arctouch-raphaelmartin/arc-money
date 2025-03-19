import SwiftUI

// MARK - AmountView

struct AmountView: View {
    
    // MARK: Internal Properties
    
    @Binding var value: Double
    
    let step: Double
    let currency: Currency
    let placeholderText: String
    
    // MARK: Lifecycle
    
    init(
        value: Binding<Double>,
        step: Double = 1.0,
        currency: Currency = .unitedStatesDollar,
        placeholderText: String = "Value")
    {
        self._value = value
        self.step = step
        self.currency = currency
        self.placeholderText = placeholderText
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
    
    @ViewBuilder
    var currencyField: some View {
        let truncatedAmount = Binding(
            get: { value },
            set: handleAmountChange)
        
        TextField(placeholderText, value: truncatedAmount, format: .currency(code: currency.isoCode))
            .textStyle(.h1)
            .multilineTextAlignment(.center)
            .keyboardType(.decimalPad)
            .selectAllTextOnBeginEditing()
    }
    
    // Function to handle text input and limit decimal places based on currency
    private func handleAmountChange(_ value: Double) {
        // Get the maximum fraction digits allowed by the currency's locale
        let maxFractionDigits = currency.formatter.minimumFractionDigits
        
        // Restrict the amount to the appropriate number of decimal places for the currency
        let multiplier = pow(10.0, Double(maxFractionDigits))
        let newValue = floor(value * multiplier) / multiplier
        self.value = newValue
    }
    
    // MARK: Body
    
    var body: some View {
        HStack {
            minusStepper
            
            Spacer()
            
            currencyField
            
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
