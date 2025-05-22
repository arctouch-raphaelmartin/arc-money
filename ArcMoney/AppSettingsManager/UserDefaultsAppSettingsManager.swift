import Combine
import Foundation

// MARK: - UserDefaultsAppSettingsManager

final class UserDefaultsAppSettingsManager: AppSettingsManager {
        
    // MARK: Private Properties
        
    private static let userDefaults = UserDefaults.standard
    
//    private var cancellables = Set<AnyCancellable>()
    
    // MARK: Lifecycle
    
    init() {
        self.currency = Self.getCurrency()
        
        configureCurrencyObserver()
//        configureCurrencyObserverCombine() // TODO: Doesn't work for some reason. Sinks not triggered.
    }
    
    deinit {
        NotificationCenter.default.removeObserver(self)
    }
        
    // MARK: Currency
    
    @Published
    var currency: Currency {
        didSet {
            setCurrency(currency)
        }
    }
    
    private func setCurrency(_ newCurrency: Currency) {
        Self.userDefaults.set(newCurrency.isoCode, forKey: Self.currencyIdentifier)
    }
    
    private static let currencyIdentifier = "ARCMONEY_CURRENCY"
    
    private static func getCurrency() -> Currency {
        guard let currencyIsoCode = userDefaults.string(forKey: currencyIdentifier),
              let currency = Currency(isoCode: currencyIsoCode)
        else {
            return defaultCurrency
        }
        
        return currency
    }
    
    private func configureCurrencyObserver() {
        NotificationCenter.default.addObserver(
            forName: UserDefaults.didChangeNotification,
            object: Self.userDefaults,
            queue: .main)
        { [weak self] _ in
            guard let self else { return }
            
            let newCurrency = Self.getCurrency()
            
            if currency != newCurrency {
                currency = newCurrency
            }
        }
    }
    
//    private func configureCurrencyObserverCombine() {
//        userDefaults.publisher(for: \.currency)
//            .sink { [weak self] newCurrencyIsoCode in
//                guard let self else { return }
//                
//                if let newCurrencyIsoCode,
//                   let newCurrency = Currency(isoCode: newCurrencyIsoCode),
//                   currency != newCurrency
//                {
//                    currency = newCurrency
//                }
//            }
//            .store(in: &cancellables)
//    }
}

//// MARK: - UserDefaults Typed KeyPath
//
//extension UserDefaults {
//    
//    // MARK: Internal Properties
//    
//    @objc dynamic var currency: String? {
//        return string(forKey: UserDefaultsAppSettingsManager.currencyIdentifier)
//    }
//}
