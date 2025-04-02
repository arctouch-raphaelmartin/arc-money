import SwiftUI

// MARK: - TransactionCard

struct TransactionCard: View {
    
    // MARK: Internal Properties
    
    let category: ArcMoneyCategory
    let title: String
    let subtitle: String
    let value: Double
    let currency: Currency
    
    // MARK: Body
    
    var body: some View {
        HStack(spacing: .oneAndQuarter) {
            icon
            content
        }
        .padding([.leading, .top, .bottom], .half)
        .padding(.trailing, .one)
        .background(.gray)
        .cornerRadius(.one)
    }
    
    // MARK: Auxiliary Views
    
    private var icon: some View {
        BackgroundedIconView(
            icon: category.icon,
            color: category.color,
            backgroundColor: category.backgroundColor,
            cornerRadius: .one)
    }
    
    private var content: some View {
        VStack(spacing: .quarter) {
            HStack(spacing: .zero) {
                Text(title)
                    
                Spacer()
                
                Text(currency.formatWithSymbol(value))
            }
            .textStyle(.sectionTitle)
            
            HStack(spacing: .zero) {
                Text(subtitle)
                
                Spacer()
                
                Text(category.title)
            }
            .textStyle(.sectionSubtitle)
        }
    }
}

// MARK: - Preview

#Preview {
    TransactionCard(
        category: .entertainment,
        title: "YouTube",
        subtitle: "16:30 PM",
        value: -60,
        currency: .unitedStatesDollar)
}
