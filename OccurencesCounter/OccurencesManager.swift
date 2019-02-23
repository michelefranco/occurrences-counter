import Foundation

struct OccurencesManager {
    func occurences(from: String) -> Set<WordOccurence> {
        let wordOccurence = WordOccurence(word: "aaaa", occurence: 2)
        var set = Set<WordOccurence>()
        set.insert(wordOccurence)
        
        return set
    }
}
