import Foundation

final class WordOccurenceReducer: WordOccurenceManager {
    private let text: String
    private lazy var occurencesSet: Set<WordOccurence> = {
        self.calculateOccurences(from: self.text)
    }()
    
    private lazy var occurencesCrescent: [WordOccurence] = {
        return self.occurencesSet.sorted { $0.occurence < $1.occurence  }
    }()
    
    private lazy var occurencesDecrescent: [WordOccurence] = {
        return self.occurencesSet.sorted { $0.occurence > $1.occurence  }
    }()
    
    init(text: String) {
        self.text = text
    }
    
    // MARK: Public functions
    
    func occurences() -> Set<WordOccurence> {
        return self.occurencesSet
    }
    
    func occurences(with order: Order) -> [WordOccurence] {
        let orderedOccurences: [WordOccurence]
        switch order {
        case .crescent:
            orderedOccurences = self.occurencesCrescent
        case .decrescent:
            orderedOccurences = self.occurencesDecrescent
        }
        
        return orderedOccurences
    }
    
    // MARK: Private functions
    
    private func calculateOccurences(from text: String) -> Set<WordOccurence> {
        let words = Prepreprocessor().words(from: text)
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
