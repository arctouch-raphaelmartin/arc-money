import SwiftUI

// MARK: - TransactionsSection

struct TransactionsSection: View {
    
    // MARK: Body
    
    var body: some View {
        VStack(alignment: .leading, spacing: .one) {
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
        List {
            ForEach(0...10, id: \.self) { _ in
                TransactionCard(
                    category: .education,
                    title: "Item",
                    subtitle: "Subtitle",
                    value: 10,
                    currency: .brazilianReal)
            }
            .listRowBackground(Color.clear)
            .listRowSeparator(.hidden)
            .listRowInsets(EdgeInsets(
                top: .half,
                bottom: .half))
            .padding(.horizontal, .oneAndHalf)
        }
        .verticalEdgesFading(amount: .half)
        .listStyle(.plain)
    }
}

// MARK: - Preview

#Preview {
    TransactionsSection()
}
