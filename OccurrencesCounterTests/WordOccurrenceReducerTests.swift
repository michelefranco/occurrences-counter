import XCTest
@testable import OccurrencesCounter

class WordOccurrenceReducerTests: XCTestCase {
    var manager: WordOccurrenceManager!
    
    func testEmptyString() {
        let input = ""
        self.manager = WordOccurrenceReducer(text: input)
        let result = manager.occurrences()
        
        let expected = Set<WordOccurrence>()
        XCTAssertEqual(result, expected, "The result is not empty")
    }
    
    
    func testOneOccurrence() {
        let input = "One"
        self.manager = WordOccurrenceReducer(text: input)
        let result = manager.occurrences()
        
        let Occurrence = WordOccurrence(word: "one", occurrence: 1)
        var expected = Set<WordOccurrence>()
        expected.insert(Occurrence)

        XCTAssertEqual(result, expected, "The result is not \(expected)")
    }
    
    func testTwoOccurrences() {
        let input = "One two"
        self.manager = WordOccurrenceReducer(text: input)
        let result = manager.occurrences()
        
        var expected = Set<WordOccurrence>()
        let firstOccurrence = WordOccurrence(word: "one", occurrence: 1)
        let secondOccurrence = WordOccurrence(word: "two", occurrence: 1)
        expected.insert(firstOccurrence)
        expected.insert(secondOccurrence)
        
        XCTAssertEqual(result, expected, "The result is not \(expected)")
    }
    
    func testOneWordTwoOccurrences() {
        let input = "One one"
        self.manager = WordOccurrenceReducer(text: input)
        let result = manager.occurrences()
        
        var expected = Set<WordOccurrence>()
        let Occurrence = WordOccurrence(word: "one", occurrence: 2)
        expected.insert(Occurrence)
        
        XCTAssertEqual(result, expected, "The result is not \(expected)")
    }
    
    func testOneWordTwoOccurrencesMultipleSpaces() {
        let input = "  One      one"
        self.manager = WordOccurrenceReducer(text: input)
        let result = manager.occurrences()
       
        var expected = Set<WordOccurrence>()
        let Occurrence = WordOccurrence(word: "one", occurrence: 2)
        expected.insert(Occurrence)
        
        XCTAssertEqual(result, expected, "The result is not \(expected)")
    }
    
    func testTwoOccurrencesNewLineMultipleSpaces() {
        let input = "  One    \n  two"
        self.manager = WordOccurrenceReducer(text: input)
        let result = manager.occurrences()
        
        var expected = Set<WordOccurrence>()
        let firstOccurrence = WordOccurrence(word: "one", occurrence: 1)
        let secondOccurrence = WordOccurrence(word: "two", occurrence: 1)
        expected.insert(firstOccurrence)
        expected.insert(secondOccurrence)
        
        XCTAssertEqual(result, expected, "The result is not \(expected)")
    }
    
    func testTwoOccurrencesWithComma() {
        let input = "One,two"
        self.manager = WordOccurrenceReducer(text: input)
        let result = manager.occurrences()
        
        var expected = Set<WordOccurrence>()
        let firstOccurrence = WordOccurrence(word: "one", occurrence: 1)
        let secondOccurrence = WordOccurrence(word: "two", occurrence: 1)
        expected.insert(firstOccurrence)
        expected.insert(secondOccurrence)
        
        XCTAssertEqual(result, expected, "The result is not \(expected)")
    }
    
    func testTwoOccurrencesWithPunctuation() {
        let input = "One,two;ONE:twO.one?two!"
        self.manager = WordOccurrenceReducer(text: input)
        let result = manager.occurrences()
        
        var expected = Set<WordOccurrence>()
        let firstOccurrence = WordOccurrence(word: "one", occurrence: 3)
        let secondOccurrence = WordOccurrence(word: "two", occurrence: 3)
        expected.insert(firstOccurrence)
        expected.insert(secondOccurrence)
        
        XCTAssertEqual(result, expected, "The result is not \(expected)")
    }
    
    func testTwoOccurrencesWithRemainingSymbols() {
        let input = "(One two) [ONE:twO] {.one?two} \"one\" *_ <>/"
        self.manager = WordOccurrenceReducer(text: input)
        let result = manager.occurrences()
       
        var expected = Set<WordOccurrence>()
        let firstOccurrence = WordOccurrence(word: "one", occurrence: 4)
        let secondOccurrence = WordOccurrence(word: "two", occurrence: 3)
        expected.insert(firstOccurrence)
        expected.insert(secondOccurrence)
        
        XCTAssertEqual(result, expected, "The result is not \(expected)")
    }
    
    func testTwoOccurrencesWithEnglishPossessive() {
        let input = "Simpson's home"
        self.manager = WordOccurrenceReducer(text: input)
        let result = manager.occurrences()
        
        var expected = Set<WordOccurrence>()
        let firstOccurrence = WordOccurrence(word: "simpson", occurrence: 1)
        let secondOccurrence = WordOccurrence(word: "home", occurrence: 1)
        expected.insert(firstOccurrence)
        expected.insert(secondOccurrence)
                
        XCTAssertEqual(result, expected, "The result is not \(expected)")
    }
    
    func testTwoOccurrencesApostrophe() {
        let input = "We're young"
        self.manager = WordOccurrenceReducer(text: input)
        let result = manager.occurrences()
        
        var expected = Set<WordOccurrence>()
        let firstOccurrence = WordOccurrence(word: "young", occurrence: 1)
        let secondOccurrence = WordOccurrence(word: "we", occurrence: 1)
        let thirdOccurrence = WordOccurrence(word: "re", occurrence: 1)
        expected.insert(firstOccurrence)
        expected.insert(secondOccurrence)
        expected.insert(thirdOccurrence)

        
        XCTAssertEqual(result, expected, "The result is not \(expected)")
    }
    
    func testTwoOccurrencesDecrescentOrder() {
        let input = "one One Two"
        self.manager = WordOccurrenceReducer(text: input)
        let result = manager.occurrences(with: .decrescent)
        
        let firstOccurrence = WordOccurrence(word: "one", occurrence: 2)
        let secondOccurrence = WordOccurrence(word: "two", occurrence: 1)
        let expected = [firstOccurrence, secondOccurrence]
        
        XCTAssertEqual(result, expected, "The result is not \(expected)")
    }
    
    func testTwoOccurrencesCrescentOrder() {
        let input = "one One Two"
        self.manager = WordOccurrenceReducer(text: input)
        let result = manager.occurrences(with: .crescent)
        
        let firstOccurrence = WordOccurrence(word: "two", occurrence: 2)
        let secondOccurrence = WordOccurrence(word: "one", occurrence: 1)
        let expected = [firstOccurrence, secondOccurrence]
        
        XCTAssertEqual(result, expected, "The result is not \(expected)")
    }
}
