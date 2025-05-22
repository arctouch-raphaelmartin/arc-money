import Foundation

// MARK: - UserDefaultsAppSettingsManagerChatGPT

final class UserDefaultsAppSettingsManagerChatGPT: AppSettingsManager {
    
    // Make it an ObservableObject
    @Published var currency: Currency {
        didSet {
            userDefaults.set(currency.isoCode, forKey: Self.currencyIdentifier)
        }
    }
    
    // MARK: Private Properties
    
    private let userDefaults = UserDefaults.standard
    
    // MARK: Currency
    
    private static let currencyIdentifier = "ARCMONEY_CURRENCY"
    
    // MARK: Initializer
    
    init() {
        // Load the initial currency from UserDefaults, or use the default.
        if let currencyIsoCode = userDefaults.string(forKey: Self.currencyIdentifier),
           let currency = Currency(isoCode: currencyIsoCode) {
            self.currency = currency
        } else {
            self.currency = Self.defaultCurrency
            userDefaults.set(Self.defaultCurrency.isoCode, forKey: Self.currencyIdentifier) // Save the default if it wasn't there
        }
        
        // Observe UserDefaults changes.  This is the KEY part.
        NotificationCenter.default.addObserver(
            forName: UserDefaults.didChangeNotification,
            object: userDefaults,
            queue: .main // Important: Update on the main thread!
        ) { [weak self] _ in
            // React to changes in UserDefaults.
            if let currencyIsoCode = self?.userDefaults.string(forKey: Self.currencyIdentifier),
               let currency = Currency(isoCode: currencyIsoCode) {
                // Only update if the value has actually changed to prevent infinite loops.
                if currency != self?.currency {
                    self?.currency = currency
                }
            } else {
                // Handle the case where the value in UserDefaults is invalid.
                self?.currency = Self.defaultCurrency
                self?.userDefaults.set(Self.defaultCurrency.isoCode, forKey: Self.currencyIdentifier) // Reset to default
            }
        }
    }
    
    deinit {
        // Remove the observer when the object is deallocated to prevent memory leaks.
        NotificationCenter.default.removeObserver(self)
    }
}
