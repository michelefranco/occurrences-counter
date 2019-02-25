import Foundation

protocol WordOccurenceManager {
    init(text: String)
    func occurences() -> Set<WordOccurence>
    func occurences(with order: Order) -> [WordOccurence]
}
