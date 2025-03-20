import Foundation

// MARK: - Currency

enum Currency: String {
    
    // MARK: Cases
    
    case brazilianReal = "Brazilian Real"
    case unitedStatesDollar = "United Stated Dollar"
    
    // MARK: Internal Properties
    
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
}
