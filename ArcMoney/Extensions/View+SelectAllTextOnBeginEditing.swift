import SwiftUI

// MARK: - View Extensions

extension View {
    
    // MARK: Select All Text on Begin Editing
    
    func selectAllTextOnBeginEditing() -> some View {
        modifier(SelectAllTextOnBeginEditingModifier())
    }
}

// MARK: - SelectAllTextOnBeginEditingModifier

/// A modifier that selects all the text of a text field when it begins editing.
private struct SelectAllTextOnBeginEditingModifier: ViewModifier {
    
    // MARK: Internal Methods
    
    func body(content: Content) -> some View {
        content
            .onReceive(NotificationCenter.default.publisher(for: UITextField.textDidBeginEditingNotification)) { obj in
                if let textField = obj.object as? UITextField {
                    textField.selectedTextRange = textField.textRange(from: textField.beginningOfDocument, to: textField.endOfDocument)
                }
            }
    }
}
