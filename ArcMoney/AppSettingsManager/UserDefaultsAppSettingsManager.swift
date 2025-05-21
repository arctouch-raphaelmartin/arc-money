import Foundation

// MARK: - UserDefaultsAppSettingsManager

final class UserDefaultsAppSettingsManager: AppSettingsManager {
        
    // MARK: Private Properties
        
    private let userDefaults = UserDefaults.standard
    
    // MARK: Currency
    
    private static let currencyIdentifier = "ARCMONEY_CURRENCY"
    
    var currency: Currency {
        getCurrency()
    }
    
    func setCurrency(_ currency: Currency) {
        userDefaults.set(currency.isoCode, forKey: Self.currencyIdentifier)
    }
    
    private func getCurrency() -> Currency {
        guard let currencyIsoCode = userDefaults.string(forKey: Self.currencyIdentifier),
              let currency = Currency(isoCode: currencyIsoCode)
        else {
            return Self.defaultCurrency
        }
        
        return currency
    }
}
