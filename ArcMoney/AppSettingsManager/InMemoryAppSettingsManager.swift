import Combine

// MARK: - InMemoryAppSettingsManager

final class InMemoryAppSettingsManager: AppSettingsManager {
    
    // MARK: Currency
    
    @Published
    var currency: Currency
    
    // MARK: Lifecycle
    
    init(currency: Currency = defaultCurrency) {
        self.currency = currency
    }
}
