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
        .background(.white)
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
    VStack {
        Spacer()
        
        Text("TransactionCard Component")
            .textStyle(.h1)
            .multilineTextAlignment(.center)
        
        Spacer()
        
        VStack {
            
            TransactionCard(
                category: .education,
                title: "College",
                subtitle: "10:00 AM",
                value: -500,
                currency: .unitedStatesDollar)
            
            TransactionCard(
                category: .food,
                title: "Burrito Delivery",
                subtitle: "13:02 PM",
                value: -9.99,
                currency: .unitedStatesDollar)
            
            TransactionCard(
                category: .entertainment,
                title: "YouTube",
                subtitle: "14:27 PM",
                value: -4.99,
                currency: .unitedStatesDollar)
            
            TransactionCard(
                category: .healthcare,
                title: "Paracetamol",
                subtitle: "12:30 PM",
                value: -7.49,
                currency: .unitedStatesDollar)
            
            TransactionCard(
                category: .salary,
                title: "Salary",
                subtitle: "17:00 PM",
                value: -1000,
                currency: .unitedStatesDollar)
        }
        .padding(.one)
        
        Spacer()
    }
    .background(.gray)
}
