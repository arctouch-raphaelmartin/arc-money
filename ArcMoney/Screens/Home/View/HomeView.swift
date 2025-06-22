import SwiftUI

// MARK: - HomeView

struct HomeView: View {
    
    // MARK: Private Properties
    
    @EnvironmentObject var tabState: TabState
    
    @StateObject var viewModel: HomeViewModel
    
    // MARK: Inits
    
    init() {
        self._viewModel = StateObject(wrappedValue: HomeViewModel())
    }
    
    // MARK: Body
    
    var body: some View {
        VStack(spacing: .oneAndHalf) {
            todaySection
            cardSection
            transactionsSection
        }
        .background(Color.light)
    }
    
    // MARK: Auxiliary Views
    
    private var todaySection: some View {
        TodaySection()
    }
    
    private var cardSection: some View {
        CardSection()
    }
    
    private var transactionsSection: some View {
        TransactionsSection()
    }
}

// MARK: - TabPresentable

extension HomeView: TabPresentable {
    
    // MARK: Internal Properties
    
    var tabItem: some View {
        Label("Home", systemImage: "house")
    }
    
    var tabIdentifier: TabIdentifier {
        .home
    }
}

// MARK: - Preview

#Preview {
    HomeView()
}
