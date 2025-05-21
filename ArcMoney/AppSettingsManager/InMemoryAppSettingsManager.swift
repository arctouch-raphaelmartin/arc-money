// MARK: - InMemoryAppSettingsManager

final class InMemoryAppSettingsManager: AppSettingsManager {
    
    // MARK: Private Properties
    
    private var _currency: Currency
    
    // MARK: Lifecycle
    
    init(currency: Currency = defaultCurrency) {
        self._currency = currency
    }
    
    // MARK: Currency
    
    var currency: Currency {
        _currency
    }
    
    func setCurrency(_ currency: Currency) {
        _currency = currency
    }
}
