import SwiftUI

// MARK: - SizeChangeObserver

struct SizeChangeObserver: ViewModifier {
    
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
