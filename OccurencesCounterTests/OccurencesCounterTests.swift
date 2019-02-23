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
        
        let occcurence = WordOccurence(word: "one", occurence: 1)
        var expected = Set<WordOccurence>()
        expected.insert(occcurence)

        XCTAssertEqual(result, expected, "The result is not \(expected)")
    }
    
}
