import Foundation

struct Prepreprocessor {
    let symbolSkipped = "_,;\'?!.:()\\[\\]{}*<>/\""
    func words(from text: String) -> [String] {
        var preprocessingOutcome = text.trimmingCharacters(in: .whitespacesAndNewlines).lowercased()
        
        preprocessingOutcome = preprocessingOutcome.replacingOccurrences(of: "(\\'s)|[\(self.symbolSkipped)]", with: " ", options: .regularExpression, range: nil)
        
        return preprocessingOutcome.components(separatedBy: .whitespacesAndNewlines)
    }
}
