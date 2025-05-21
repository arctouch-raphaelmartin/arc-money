import Foundation

// MARK: - Currency

enum Currency: String, CaseIterable {
    
    // MARK: Cases
    
    case brazilianReal = "Brazilian Real"
    case unitedStatesDollar = "United States Dollar"
    
    // MARK: Lifecycle
    
    init?(isoCode: String) {
        for currency in Currency.allCases {
            if currency.isoCode == isoCode {
                self = currency
                return
            }
        }
        
        return nil // Invalid isoCode.
    }
    
    // MARK: Internal Properties
    
    var title: String {
        rawValue
    }
    
    var isoCode: String {
        switch self {
        case .brazilianReal:
            "BRL"
        case .unitedStatesDollar:
            "USD"
        }
    }
    
    var formatter: NumberFormatter {
        let formatter = NumberFormatter()
        formatter.numberStyle = .currency
        formatter.currencyCode = self.isoCode
        
        return formatter
    }
    
    // MARK: Internal Methods
    
    func formatWithSymbol(_ value: Double) -> String {
        return value.formatted(.currency(code: self.isoCode))
    }
}
