import XCTest
@testable import OccurencesCounter

class OccurencesCounterTests: XCTestCase {
    let manager = OccurencesManager()
    override func setUp() {
        // Put setup code here. This method is called before the invocation of each test method in the class.
    }

    override func tearDown() {
        // Put teardown code here. This method is called after the invocation of each test method in the class.
    }
    
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
        
        XCTAssertEqual(result, expected, "The result is not \(expected)")
    }
}
