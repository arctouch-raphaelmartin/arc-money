import SwiftUI

// MARK: - TransactionsSection

struct TransactionsSection: View {
    
    // MARK: Body
    
    var body: some View {
        VStack(alignment: .leading, spacing: .oneAndHalf) {
            header
            transactionList
        }
    }
    
    // MARK: Auxiliary Views
    
    private var header: some View {
        Text("Today's Transactions")
            .textStyle(.sectionTitle)
            .foregroundStyle(Color.primary)
            .padding(.horizontal, .oneAndHalf)
    }
    
    private var transactionList: some View {
        ScrollView {
            LazyVStack(alignment: .leading, spacing: .half) {
                ForEach(0...10, id: \.self) { _ in
                    TransactionCard(
                        category: .education,
                        title: "Item",
                        subtitle: "Subtitle",
                        value: 10,
                        currency: .brazilianReal)
                }
            }
            .padding(.horizontal, .oneAndHalf)
        }
    }
}

// MARK: - Preview

#Preview {
    TransactionsSection()
}
