import SwiftUI

// MARK: - StatisticsView

struct StatisticsView: View {
    
    // MARK: Body
    
    var body: some View {
        Text("This is the Statistics View")
    }
}

// MARK: - TabPresentable

extension StatisticsView: TabPresentable {
    
    // MARK: Internal Properties
    
    var tabItem: some View {
        Label("Statistics", systemImage: "chart.xyaxis.line")
    }
    
    var tabIdentifier: TabIdentifier {
        .statistics
    }
}
