import Foundation

enum Order {
    case crescent, decrescent
}

struct OccurencesManager {
    func occurences(from text: String, with order: Order) -> [WordOccurence] {
        let empty = WordOccurence(word: "", occurence: 1)
        return [empty]
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
