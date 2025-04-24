import SwiftUI

// MARK: - AppView

struct AppView: View {
    @State private var selectedTab = HomeView.tabIdentifier
    
    var body: some View {
        TabView(selection: $selectedTab) {
            HomeView()
                .tabItem {
                    HomeView.tabItem
                }
                .tag(HomeView.tabIdentifier)
            
            StatisticsView()
                .tabItem {
                    StatisticsView.tabItem
                }
                .tag(StatisticsView.tabIdentifier)
            
            SettingsView()
                .tabItem {
                    SettingsView.tabItem
                }
                .tag(SettingsView.tabIdentifier)
        }
    }
}

// MARK: - Preview

#Preview {
    AppView()
}

// MARK: - TabPresentable

protocol TabPresentable {
    associatedtype TabLabel: View
    
    @ViewBuilder
    static var tabItem: TabLabel { get }
    
    static var tabIdentifier: String { get }
}

// MARK: - HomeView

struct HomeView: View {
    var body: some View {
        Text("This is the Home View")
    }
}

extension HomeView: TabPresentable {
    static var tabItem: some View {
        Label("Home", systemImage: "house")
    }
    
    static var tabIdentifier: String {
        "Home"
    }
}

// MARK: - StatisticsView

struct StatisticsView: View {
    var body: some View {
        Text("This is the Statistics View")
    }
}

extension StatisticsView: TabPresentable {
    static var tabItem: some View {
        Label("Statistics", systemImage: "chart.xyaxis.line")
    }
    
    static var tabIdentifier: String {
        "Statistics"
    }
}

// MARK: - SettingsView

struct SettingsView: View {
    var body: some View {
        Text("This is the Settings View")
    }
}

extension SettingsView: TabPresentable {
    static var tabItem: some View {
        Label("Settings", systemImage: "gearshape")
    }
    
    static var tabIdentifier: String {
        "Settings"
    }
}
