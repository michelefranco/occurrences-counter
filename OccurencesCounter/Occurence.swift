import Foundation

struct WordOccurence: Hashable {
    let word: String
    let occurence: Int
    
    var hashValue: Int {
        return word.hashValue
    }
    
    static func ==(lhs: WordOccurence, rhs: WordOccurence) -> Bool {
        return lhs.word == rhs.word
    }
}
