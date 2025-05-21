// MARK: - AppSettingsManager

protocol AppSettingsManager {
    
    // MARK: Default Values
    
    /// The default currency to be used throughout the app.
    static var defaultCurrency: Currency { get }
    
    // MARK: Currency
    
    /// The currently selected currency to be used throughout the app.
    var currency: Currency { get }
    
    /// Saves a new currency to be used throughout the app.
    /// - Parameter currency: The new currency to be saved.
    func setCurrency(_ currency: Currency)
}

// MARK: - Default Implementations

extension AppSettingsManager {
    
    // MARK: Internal Properties
    
    static var defaultCurrency: Currency { .unitedStatesDollar }
}
