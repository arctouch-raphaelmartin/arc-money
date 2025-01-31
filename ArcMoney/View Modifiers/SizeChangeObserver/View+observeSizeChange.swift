import SwiftUI

// MARK: - View + observeSizeChange

extension View {
    
    // MARK: Internal Methods
    
    func observeSizeChange(_ size: Binding<CGSize>, updateWithAnimation animation: Animation? = nil) -> some View {
        modifier(SizeChangeObserver(
            size: size,
            animation: animation))
    }
}
