import Combine
import Foundation

// MARK: - AppSettingsManager

final class AppSettingsManager: ObservableObject {
    
    // MARK: Internal Properties
    
    /// The default currency to be used throughout the app.
    static var defaultCurrency: Currency = .unitedStatesDollar
    
    /// The currently selected currency to be used throughout the app.
    var currency: Currency = defaultCurrency
    
    // MARK: Private Properties
    
    fileprivate static let currencyIdentifier = "ARCMONEY_CURRENCY"
    
    private let userDefaults = UserDefaults.standard
    
    private var cancellables = Set<AnyCancellable>()
    
    // MARK: Lifecycle
    
    init() {
        configureCurrencyObserver()
    }
    
    // MARK: Private Methods
    
    private func configureCurrencyObserver() {
        userDefaults.publisher(for: \.currency)
            .sink { newCurrencyValue in
                if let newCurrencyValue, let currency = Currency(isoCode: newCurrencyValue) {
                    self.currency = currency
                }
            }
            .store(in: &cancellables)
    }
}

// MARK: - UserDefaults Typed KeyPath

extension UserDefaults {
    
    // MARK: Internal Properties
    
    @objc dynamic var currency: String? {
        return string(forKey: AppSettingsManager.currencyIdentifier)
    }
}
