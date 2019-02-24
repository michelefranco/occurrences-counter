import Foundation

enum Order {
    case crescent, decrescent
}

struct OccurencesManager {
    func occurences(from text: String, with order: Order) -> [WordOccurence] {
        let occurences = self.occurences(from: text)
        
        let orderedOccurences: [WordOccurence]
        switch order {
        case .crescent:
            orderedOccurences = occurences.sorted { $0.occurence < $1.occurence  }
        case .decrescent:
            orderedOccurences = occurences.sorted { $0.occurence > $1.occurence  }
        }
        
        return orderedOccurences
    }
    
    
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
