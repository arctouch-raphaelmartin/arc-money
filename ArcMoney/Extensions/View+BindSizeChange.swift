import SwiftUI

// MARK: - View Extensions

extension View {
    
    // MARK: Bind Size Change
    
    func bindSizeChange(
        to binding: Binding<CGSize>,
        updateWithAnimation animation: Animation? = nil)
    -> some View {
        modifier(BindSizeChangeModifier(
            size: binding,
            animation: animation))
    }
}

// MARK: - BindSizeChangeModifier

/// A modifier that retrieves size changes of the view it is attached to through a GeometryReader.
struct BindSizeChangeModifier: ViewModifier {
    
    // MARK: Internal Properties
    
    @Binding var size: CGSize
    
    let animation: Animation?
    
    // MARK: Internal Methods
    
    func body(content: Content) -> some View {
        content
            .overlay(GeometryReader { geometryProxy in
                Color.clear.onAppear {
                    if let animation {
                        withAnimation(animation) {
                            size = geometryProxy.size
                        }
                    } else {
                        size = geometryProxy.size
                    }
                }
            })
    }
}
