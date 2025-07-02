import SwiftUI

// MARK: - CardSection

struct CardSection: View {
    
    // MARK: Private Properties
    
    private let cardWidth: CGFloat = 326
    private let cardHeight: CGFloat = 160
    
    private var cardBottomPadding: CGFloat {
        max(middleCardOffsetY, backCardOffsetY)
    }
    
    private let middleCardScaleMultiplier: CGFloat = 0.85
    private let middleCardOffsetY: CGFloat = 10
    
    private let backCardScaleMultiplier: CGFloat = 0.7
    private let backCardOffsetY: CGFloat = 20
    
    // MARK: Body
    
    var body: some View {
        ZStack(alignment: .bottom) {
            backCard
            middleCard
            frontCard
        }
        .padding(.bottom, cardBottomPadding)
    }
    
    // MARK: Auxiliary Views
    
    private var frontCard: some View {
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
    
    private var middleCard: some View {
        Color.lightGray
            .frame(
                width: cardWidth * middleCardScaleMultiplier,
                height: cardHeight * middleCardScaleMultiplier)
            .cornerRadius(.oneAndQuarter)
            .offset(y: middleCardOffsetY)
    }
    
    private var backCard: some View {
        Color.lighterGray
            .frame(
                width: cardWidth * backCardScaleMultiplier,
                height: cardHeight * backCardScaleMultiplier)
            .cornerRadius(.oneAndQuarter)
            .offset(y: backCardOffsetY)
    }
}

// MARK: - Preview

#Preview {
    CardSection()
}
