import XCTest
@testable import OccurencesCounter

class OccurencesCounterTests: XCTestCase {
    let manager = OccurencesManager()
    
    func testEmptyString() {
        let input = ""
        let result = manager.occurences(from: input)
        
        let expected = Set<WordOccurence>()
        XCTAssertEqual(result, expected, "The result is not empty")
    }
    
    
    func testOneOccurence() {
        let input = "One"
        let result = manager.occurences(from: input)
        
        let occurence = WordOccurence(word: "one", occurence: 1)
        var expected = Set<WordOccurence>()
        expected.insert(occurence)

        XCTAssertEqual(result, expected, "The result is not \(expected)")
    }
    
    func testTwoOccurences() {
        let input = "One two"
        let result = manager.occurences(from: input)
        
        var expected = Set<WordOccurence>()
        let firstOccurence = WordOccurence(word: "one", occurence: 1)
        let secondOccurence = WordOccurence(word: "two", occurence: 1)
        expected.insert(firstOccurence)
        expected.insert(secondOccurence)
        
        XCTAssertEqual(result, expected, "The result is not \(expected)")
    }
    
    func testOneWordTwoOccurences() {
        let input = "One one"
        let result = manager.occurences(from: input)
        
        var expected = Set<WordOccurence>()
        let occurence = WordOccurence(word: "one", occurence: 2)
        expected.insert(occurence)
        
        XCTAssertEqual(result, expected, "The result is not \(expected)")
    }
    
    func testOneWordTwoOccurencesMultipleSpaces() {
        let input = "  One      one"
        let result = manager.occurences(from: input)
       
        var expected = Set<WordOccurence>()
        let occurence = WordOccurence(word: "one", occurence: 2)
        expected.insert(occurence)
        
        XCTAssertEqual(result, expected, "The result is not \(expected)")
    }
    
    func testTwoOccurencesNewLineMultipleSpaces() {
        let input = "  One    \n  two"
        let result = manager.occurences(from: input)
        
        var expected = Set<WordOccurence>()
        let firstOccurence = WordOccurence(word: "one", occurence: 1)
        let secondOccurence = WordOccurence(word: "two", occurence: 1)
        expected.insert(firstOccurence)
        expected.insert(secondOccurence)
        
        XCTAssertEqual(result, expected, "The result is not \(expected)")
    }
    
    func testTwoOccurencesWithComma() {
        let input = "One,two"
        let result = manager.occurences(from: input)
        
        var expected = Set<WordOccurence>()
        let firstOccurence = WordOccurence(word: "one", occurence: 1)
        let secondOccurence = WordOccurence(word: "two", occurence: 1)
        expected.insert(firstOccurence)
        expected.insert(secondOccurence)
        
        XCTAssertEqual(result, expected, "The result is not \(expected)")
    }
    
    func testTwoOccurencesWithPunctuation() {
        let input = "One,two;ONE:twO.one?two!"
        let result = manager.occurences(from: input)
        
        var expected = Set<WordOccurence>()
        let firstOccurence = WordOccurence(word: "one", occurence: 3)
        let secondOccurence = WordOccurence(word: "two", occurence: 3)
        expected.insert(firstOccurence)
        expected.insert(secondOccurence)
        
        XCTAssertEqual(result, expected, "The result is not \(expected)")
    }
    
    func testTwoOccurencesWithRemainingSymbols() {
        let input = "(One two) [ONE:twO] {.one?two} \"one\" *_ <>/"
        let result = manager.occurences(from: input)
       
        var expected = Set<WordOccurence>()
        let firstOccurence = WordOccurence(word: "one", occurence: 4)
        let secondOccurence = WordOccurence(word: "two", occurence: 3)
        expected.insert(firstOccurence)
        expected.insert(secondOccurence)
        
        XCTAssertEqual(result, expected, "The result is not \(expected)")
    }
    
    func testTwoOccurencesWithEnglishPossessive() {
        let input = "Simpson's home"
        let result = manager.occurences(from: input)
        
        var expected = Set<WordOccurence>()
        let firstOccurence = WordOccurence(word: "simpson", occurence: 1)
        let secondOccurence = WordOccurence(word: "home", occurence: 1)
        expected.insert(firstOccurence)
        expected.insert(secondOccurence)
                
        XCTAssertEqual(result, expected, "The result is not \(expected)")
    }
    
    func testTwoOccurencesDecrescentOrder() {
        let input = "one One Two"
        let result = manager.occurences(from: input, with: .decrescent)
        
        let firstOccurence = WordOccurence(word: "one", occurence: 2)
        let secondOccurence = WordOccurence(word: "two", occurence: 1)
        let expected = [firstOccurence, secondOccurence]
        
        XCTAssertEqual(result, expected, "The result is not \(expected)")
    }
    
    func testTwoOccurencesCrescentOrder() {
        let input = "one One Two"
        let result = manager.occurences(from: input, with: .crescent)
        
        let firstOccurence = WordOccurence(word: "two", occurence: 2)
        let expected = [firstOccurence]
        
        XCTAssertEqual(result, expected, "The result is not \(expected)")
    }
}
