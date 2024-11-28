import SwiftUI

struct H1: View {
  var text: String
  var body: some View {
    Text(text)
      .font(.custom("ReadexPro-Medium", size: 32))
  }
}

struct H2: View {
  var text: String
  var body: some View {
    Text(text)
      .font(.custom("ReadexPro-Medium", size: 24))
  }
}

struct SectionTitle: View {
  var text: String
  var body: some View {
    Text(text)
      .font(.custom("ReadexPro-Medium", size: 16))
  }
}

struct SectionSubtitle: View {
  var text: String
  var body: some View {
    Text(text)
      .font(.custom("ReadexPro-Regular", size: 14))
  }
}

struct Small: View {
  var text: String
  var body: some View {
    Text(text)
      .font(.custom("ReadexPro-Regular", size: 12))
  }
}

#Preview {
  VStack {
    H1(text: "This is H1")
    Spacer()
    H2(text: "This is H2")
    Spacer()
    SectionTitle(text: "This is SectionTitle")
    Spacer()
    SectionSubtitle(text: "This is SectionSubtitle")
    Spacer()
    Small(text: "This is Small")
  }.padding(.vertical, 100)
}
