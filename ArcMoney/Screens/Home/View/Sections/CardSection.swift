import SwiftUI

// MARK: - CardSection

struct CardSection: View {
    
    // MARK: Private Properties
    
    private let cardWidth: CGFloat = 326
    private let cardHeight: CGFloat = 160
    
    // MARK: Body
    
    var body: some View {
        // QUESTION: This approach works, but the final frame is still the front card. I'd like it to
        // incorporate the offsetted views as well.
        ZStack {
            backCard
            middleCard
            frontCard
        }
        .padding(.horizontal, .oneAndHalf)
    }
    
    // MARK: Auxiliary Views
    
    private var frontCard: some View {
        ZStack(alignment: .topLeading) {
            Color.primary
                .frame(width: cardWidth, height: cardHeight)
                .background(Color.primary)
                .cornerRadius(.oneAndQuarter)
                .overlay(alignment: .topLeading) {
                    HStack(alignment: .top) {
                        Text("$521,985.00")
                            .textStyle(.h1)
                            .foregroundStyle(Color.white)
                            .padding(.oneAndHalf)
                        
                        Spacer()
                        
                        RoundButton(
                            icon: .ellipsis,
                            iconColor: .white,
                            backgroundColor: .clear) {
                                print("...")
                            }
                            .padding(.threeQuarters)
                    }
                }
        }
    }
    
    private var middleCard: some View {
        Color.lightGray
            .frame(width: cardWidth, height: cardHeight)
            .cornerRadius(.oneAndQuarter)
            .scaleEffect(0.85)
            .offset(y: 20)
    }
    
    private var backCard: some View {
        Color.lighterGray
            .frame(width: cardWidth, height: cardHeight)
            .cornerRadius(.oneAndQuarter)
            .scaleEffect(0.7)
            .offset(y: 40)
    }
}

// MARK: - Preview

#Preview {
    CardSection()
}
