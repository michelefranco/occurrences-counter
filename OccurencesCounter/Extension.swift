import Foundation

extension Int {
    
    // complexity: O(n)
    var isPrime: Bool {
        guard self > 1 else { return false }
        
        let result: Bool
        switch self {
        case 2,3:
            result = true
        default:
            let maxDivider = Int(sqrt(Double(self)))
            result = !(2...maxDivider).contains { self % $0 == 0 }
        }
        
        return result
    }
}
