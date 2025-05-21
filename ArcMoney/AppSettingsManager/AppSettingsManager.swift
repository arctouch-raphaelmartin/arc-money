import Combine

// MARK: - AppSettingsManager

protocol AppSettingsManager: ObservableObject {
    
    // MARK: Default Values
    
    /// The default currency to be used throughout the app.
    static var defaultCurrency: Currency { get }
    
    // MARK: Currency
    
    /// The currently selected currency to be used throughout the app.
    var currency: Currency { get set }
}

// MARK: - Default Implementations

extension AppSettingsManager {
    
    // MARK: Internal Properties
    
    static var defaultCurrency: Currency { .unitedStatesDollar }
}
