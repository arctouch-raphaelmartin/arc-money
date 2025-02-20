import Foundation

// MARK: - Currency

enum Currency: String {
    
    // MARK: Cases
    
    case brazilianReal = "Brazilian Real"
    case unitedStatesDollar = "United Stated Dollar"
    
    // MARK: Internal Properties
    
    var symbol: String {
        switch self {
        case .brazilianReal:
            "R$"
        case .unitedStatesDollar:
            "$"
        }
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
    
    func formatWithSymbol(_ value: Double, floatingPointNumber: Int = 2) -> String {
        return value.formatted(.currency(code: self.isoCode))
    }
}
