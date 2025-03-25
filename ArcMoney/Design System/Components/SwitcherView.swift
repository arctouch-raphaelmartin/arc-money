import SwiftUI

// MARK: - SwitcherData

protocol SwitcherData: Hashable {
    
    // MARK: Internal Properties
    
    var title: String { get }
}

// MARK: - Temp

enum Frequency: SwitcherData {
    
    // MARK: Cases
    
    case daily
    case weekly
    case monthly
    case yearly
    
    // MARK: Internal Properties
    
    var title: String {
        switch self {
        case .daily:
            "Daily"
        case .weekly:
            "Weekly"
        case .monthly:
            "Monthly"
        case .yearly:
            "Yearly"
        }
    }
}

// MARK: - SwitcherView

struct SwitcherView<Data: SwitcherData>: View {
    
    // MARK: Internal Properties

    let options: [Data]
    
    @Binding var selectedOption: Data
    
    // MARK: Private Properties
    
    @Namespace private var animation
    
    private let selectedPillID = "selectedPillID"
    
    // MARK: Lifecycle
    
    init(selectedOption: Binding<Data>, options: [Data]) {
        self._selectedOption = selectedOption
        self.options = options
    }
    
    // MARK: Body
    
    var body: some View {
        HStack(spacing: 8) {
            ForEach(options, id: \.self) { option in
                Text(option.title)
                    .padding(.horizontal, 16)
                    .padding(.vertical, 8)
                    .background {
                        if selectedOption == option {
                            Capsule()
                                .fill(Color.primary)
                                .matchedGeometryEffect(id: selectedPillID, in: animation)
                        } else {
                            Capsule()
                                .fill(Color.clear)
                        }
                    }
                    .foregroundColor(selectedOption == option ? Color.white : Color.gray)
                    .onTapGesture {
                        withAnimation(.smooth) {
                            selectedOption = option
                        }
                    }
            }
        }
        .background(Color.white)
        .clipShape(Capsule())
        .onChange(of: selectedOption) { checkIfValid($1) }
        .onAppear { checkIfValid(selectedOption) }
    }

    func checkIfValid(_ data: Data) {
        if !options.contains(data), let firstOption = options.first {
            selectedOption = firstOption
        }
    }
}

// MARK: - Preview

#Preview {
    @Previewable @State var selectedOption: Frequency = .daily
    
    let options: [Frequency] = [
        .weekly, .monthly, .yearly
    ]
    
    VStack {
        Text("Switcher")
                        
        SwitcherView(selectedOption: $selectedOption, options: options)
    }
    .padding()
    .background(Color.gray)
}
