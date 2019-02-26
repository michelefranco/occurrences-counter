import Foundation

protocol WordOccurrenceManager {
    init(text: String)
    func occurrences() -> Set<WordOccurrence>
    func occurrences(with order: Order) -> [WordOccurrence]
}
