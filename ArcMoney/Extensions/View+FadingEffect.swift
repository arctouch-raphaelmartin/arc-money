import SwiftUI

// MARK: - View Extensions

extension View {
    
    // MARK: Fading
    
    /// Applies a fading effect to the view, with fade length specified in points.
    ///
    /// - Parameters:
    ///   - startPoint: The starting point of the gradient mask (e.g., `.leading`, `.top`).
    ///   - endPoint: The ending point of the gradient mask (e.g., `.trailing`, `.bottom`).
    ///   - amount: The absolute length (in points) of the fade effect.
    func fading(startPoint: UnitPoint, endPoint: UnitPoint, amount: CGFloat) -> some View {
        self.modifier(FadingEffectModifier(
            startPoint: startPoint,
            endPoint: endPoint,
            fadeAmount: amount))
    }
    
    /// Applies a fading effect to the view, with fade length specified in the app's spacing definitions.
    ///
    /// - Parameters:
    ///   - startPoint: The starting point of the gradient mask (e.g., `.leading`, `.top`).
    ///   - endPoint: The ending point of the gradient mask (e.g., `.trailing`, `.bottom`).
    ///   - amount: The absolute length (in the app's spacing definitions) of the fade effect.
    func fading(startPoint: UnitPoint, endPoint: UnitPoint, amount: ArcMoneySpacing) -> some View {
        fading(
            startPoint: startPoint,
            endPoint: endPoint,
            amount: amount.rawValue)
    }
    
    /// Applies a top fading effect to the view, with fade length specified in points.
    ///
    /// - Parameters:
    ///   - amount: The absolute length (in the app's spacing definitions) of the fade effect.
    func topFading(amount: ArcMoneySpacing) -> some View {
        fading(
            startPoint: .top,
            endPoint: .bottom,
            amount: amount)
    }
    
    /// Applies a bottom fading effect to the view, with fade length specified in points.
    ///
    /// - Parameters:
    ///   - amount: The absolute length (in the app's spacing definitions) of the fade effect.
    func bottomFading(amount: ArcMoneySpacing) -> some View {
        fading(
            startPoint: .bottom,
            endPoint: .top,
            amount: amount)
    }
    
    /// Applies a fading effect to the top and bottom edges of the view, with fade length specified in points.
    ///
    /// - Parameters:
    ///   - amount: The absolute length (in the app's spacing definitions) of the fade effect.
    func verticalEdgesFading(amount: ArcMoneySpacing) -> some View {
        self
            .topFading(amount: amount)
            .bottomFading(amount: amount)
    }
}

// MARK: - FadingEffectModifier

private struct FadingEffectModifier: ViewModifier {
    
    // MARK: Internal Properties
    
    let startPoint: UnitPoint
    let endPoint: UnitPoint
    let fadeAmount: CGFloat // The absolute length of the fade in points
    
    // MARK: Internal Methods
    
    func body(content: Content) -> some View {
        content
            .mask(
                GeometryReader { geometry in
                    let totalLength: CGFloat
                    if startPoint == .top || startPoint == .bottom {
                        totalLength = geometry.size.height
                    } else if startPoint == .leading || startPoint == .trailing {
                        totalLength = geometry.size.width
                    } else {
                        totalLength = max(geometry.size.width, geometry.size.height)
                    }
                    
                    let clampedFadeAmount = min(fadeAmount, totalLength)
                    
                    let startFadeLocation = clampedFadeAmount / totalLength
                    
                    return LinearGradient(
                        gradient: Gradient(stops: [
                            .init(color: .clear, location: 0.0),
                            .init(color: .black, location: startFadeLocation),
                            .init(color: .black, location: 1.0)
                        ]),
                        startPoint: startPoint,
                        endPoint: endPoint
                    )
                }
            )
    }
}
