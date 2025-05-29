import SwiftUI

final class TabManager: ObservableObject {
    private var _tabsFactory: [any TabFactory]
    
    public var tabsFactory: [any TabFactory] {
        _tabsFactory
    }
    
    init() {
        _tabsFactory = [
            HomeTabFactory(),
            StatisticsTabFactory(),
            SettingsTabFactory()
        ]
        
        var userIsSignedIn: Bool = false
        
        if userIsSignedIn {
//            _tabsFactory.append(ProfileTabFactory())
        }
    }
}

protocol TabFactory {
    associatedtype TabView: TabPresentable
    
    var id: TabIdentifier { get }
    
    func makeTab() -> TabView
}

class HomeTabFactory: TabFactory {
    var id: TabIdentifier { HomeView.tabIdentifier }
    
    func makeTab() -> HomeView {
        // let viewModel = HomeViewModel()
        
        return HomeView()
            // .environmentObject(HomeViewModel())
    }
}

class StatisticsTabFactory: TabFactory {
    var id: TabIdentifier { StatisticsView.tabIdentifier }
    
    func makeTab() -> StatisticsView {
        return StatisticsView()
    }
}

class SettingsTabFactory: TabFactory {
    var id: TabIdentifier { SettingsView.tabIdentifier }
    
    func makeTab() -> SettingsView {
        return SettingsView()
    }
}
