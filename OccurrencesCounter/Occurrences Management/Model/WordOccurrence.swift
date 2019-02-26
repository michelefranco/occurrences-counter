import Foundation

struct WordOccurrence: Hashable {
    let word: String
    let occurrence: Int
    
    var hashValue: Int {
        return word.hashValue
    }
    
    static func ==(lhs: WordOccurrence, rhs: WordOccurrence) -> Bool {
        return lhs.word == rhs.word
    }
}
