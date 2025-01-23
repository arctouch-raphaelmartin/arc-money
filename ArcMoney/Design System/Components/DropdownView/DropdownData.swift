// MARK: - DropdownData

struct DropdownData: Hashable {
    
    // MARK: Internal Properties
    
    let icon: ArcMoneyIcon
    let title: String
    
    // MARK: Internal Methods
    
    static func == (lhs: DropdownData, rhs: DropdownData) -> Bool {
        lhs.icon == rhs.icon && lhs.title == rhs.title
    }
}
