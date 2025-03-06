import SwiftUI

// MARK: - View Extensions

extension View {
    
    // MARK: Disable Scroll Bounce
    
    func disableScrollBounce() -> some View {
        modifier(DisableScrollBounceModifier())
    }
}

// MARK: - DisableScrollBounceModifier

/// A modifier that disables the scroll bounce for scroll views.
private struct DisableScrollBounceModifier: ViewModifier {
    
    // MARK: Internal Methods
    
    func body(content: Content) -> some View {
        content
            .onAppear {
                UIScrollView.appearance().bounces = false
            }
            .onDisappear {
                UIScrollView.appearance().bounces = true
            }
    }
}
