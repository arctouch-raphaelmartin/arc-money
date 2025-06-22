import SwiftUI

// MARK: - TodaySection

struct TodaySection: View {
    
    // MARK: Body
    
    var body: some View {
        HStack {
            VStack(alignment: .leading) {
                title
                subtitle
            }
            
            Spacer()
            
            bellButton
        }
        .padding(.horizontal, .oneAndHalf)
    }
    
    // MARK: Auxiliary Views
    
    private var title: some View {
        Text("Sunday,")
            .textStyle(.small)
            .foregroundStyle(Color.dark)
    }
    
    private var subtitle: some View {
        Text("20 November")
            .textStyle(.sectionTitle)
            .foregroundStyle(Color.primary)
    }
    
    private var bellButton: some View {
        RoundButton(icon: .notification) {
            print("tap")
        }
    }
}

// MARK: - Preview

#Preview {
    TodaySection()
}
