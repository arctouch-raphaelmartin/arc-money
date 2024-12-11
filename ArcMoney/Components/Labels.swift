import SwiftUI

enum TextStyle {
    case h1, h2, sectionTitle, sectionSubtitle, small
    
    var fontName: String {
        switch self {
        case .h1, .h2, .sectionTitle:
            return "ReadexPro-Medium"
        case .sectionSubtitle, .small:
            return "ReadexPro-Regular"
        }
    }
    
    var fontSize: CGFloat {
        switch self {
        case .h1:
            return 32
        case .h2:
            return 24
        case .sectionTitle:
            return 16
        case .sectionSubtitle:
            return 14
        case .small:
            return 12
        }
    }
}

struct FontStyle: ViewModifier {
    var style: TextStyle
    
    func body(content: Content) -> some View {
        content.font(.custom(style.fontName, size: style.fontSize))
    }
}

extension View {
    func customStyle(_ style: TextStyle) -> some View {
        self.modifier(FontStyle(style: style))
    }
}

#Preview {
    VStack {
        Text("This is H1")
            .customStyle(.h1)
        Spacer()
        Text("This is H2")
            .customStyle(.h2)
        Spacer()
        Text("This is SectionTitle")
            .customStyle(.sectionTitle)
        Spacer()
        Text("This is SectionSubtitle")
            .customStyle(.sectionSubtitle)
        Spacer()
        Text("This is Small")
            .customStyle(.small)
    }.padding(.vertical, 100)
}
