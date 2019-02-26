import Foundation

final class WordOccurrenceReducer: WordOccurrenceManager {
    private let text: String
    private lazy var occurrencesSet: Set<WordOccurrence> = {
        self.calculateOccurrences(from: self.text)
    }()
    
    private lazy var occurrencesCrescent: [WordOccurrence] = {
        return self.occurrencesSet.sorted { $0.occurrence < $1.occurrence  }
    }()
    
    private lazy var occurrencesDecrescent: [WordOccurrence] = {
        return self.occurrencesSet.sorted { $0.occurrence > $1.occurrence  }
    }()
    
    init(text: String) {
        self.text = text
    }
    
    // MARK: Public functions
    
    func occurrences() -> Set<WordOccurrence> {
        return self.occurrencesSet
    }
    
    func occurrences(with order: Order) -> [WordOccurrence] {
        let orderedOccurrences: [WordOccurrence]
        switch order {
        case .crescent:
            orderedOccurrences = self.occurrencesCrescent
        case .decrescent:
            orderedOccurrences = self.occurrencesDecrescent
        }
        
        return orderedOccurrences
    }
    
    // MARK: Private functions
    
    private func calculateOccurrences(from text: String) -> Set<WordOccurrence> {
        let words = Prepreprocessor().words(from: text)
        let dictionary = self.map(from: words)
        var set = Set<WordOccurrence>()
        
        dictionary.forEach { word, occurrence in
            let wordOccurrences = WordOccurrence(word: word, occurrence: occurrence)
            set.insert(wordOccurrences)
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
