import Foundation

struct Prepreprocessor {
    static func words(from text: String) -> [String] {
        var preprocessingOutcome = text.trimmingCharacters(in: .whitespacesAndNewlines).lowercased()
        
        preprocessingOutcome = preprocessingOutcome.replacingOccurrences(of: "[,;?!.:]", with: " ", options: .regularExpression, range: nil)
        
        return preprocessingOutcome.components(separatedBy: .whitespacesAndNewlines)
    }
}

struct OccurencesManager {
    func occurences(from text: String) -> Set<WordOccurence> {
        
        let words = Prepreprocessor.words(from: text)
        let dictionary = self.map(from: words)
        var set = Set<WordOccurence>()
        
        dictionary.forEach { word, occurence in
            let wordOccurences = WordOccurence(word: word, occurence: occurence)
            set.insert(wordOccurences)
        }
        
        return set
    }
    
    private func map(from words: [String]) -> [String: Int] {
        return words.reduce(into: [:]) { counts, word in
            if !word.isEmpty {
                counts[word, default: 0] += 1
            }
        }
    }
}
