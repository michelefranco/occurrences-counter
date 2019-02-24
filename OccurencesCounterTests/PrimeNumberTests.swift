import XCTest
@testable import OccurencesCounter

class PrimeNumberTests: XCTestCase {
    
    func testPrimeNumber_2() {
        let input = 2
        let result = input.isPrime
        
        let expected = true
        XCTAssertEqual(result, expected, "result is wrong for input: \(input)")
    }
}
