import Foundation

struct Prepreprocessor {
    static func words(from text: String) -> [String] {
        var preprocessingOutcome = text.trimmingCharacters(in: .whitespacesAndNewlines).lowercased()
        
        let symbols = "_,;?!.:()\\[\\]{}*<>/\""
        preprocessingOutcome = preprocessingOutcome.replacingOccurrences(of: "[\(symbols)]|'s", with: " ", options: .regularExpression, range: nil)
        
        return preprocessingOutcome.components(separatedBy: .whitespacesAndNewlines)
    }
}
