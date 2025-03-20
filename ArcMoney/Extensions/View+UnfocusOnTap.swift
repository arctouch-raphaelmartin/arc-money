import SwiftUI

// MARK: - View Extensions

extension View {
    
    // MARK: Unfocus onTap
    
    func unfocusOnTap() -> some View {
        modifier(UnfocusOnTapModifier())
    }
}

// MARK: - UnfocusOnTapModifier

/// A modifier that resigns First Responder.
/// Supports both iOS and macOS apps.
private struct UnfocusOnTapModifier: ViewModifier {
    
    // MARK: Internal Methods
    
    func body(content: Content) -> some View {
        content
#if os (iOS)
            .onTapGesture {
                UIApplication.shared.sendAction(#selector(UIResponder.resignFirstResponder), to:nil, from:nil, for:nil)
            }
#elseif os(macOS) // UIApplication is not available for macOS.
            .onTapGesture {
                DispatchQueue.main.async {
                    NSApp.keyWindow?.makeFirstResponder(nil)
                }
            }
#endif
    }
}
