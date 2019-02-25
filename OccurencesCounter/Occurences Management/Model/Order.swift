import Foundation

enum Order {
    case crescent, decrescent
    
    var description: String {
        switch self {
        case .decrescent:
            return "Decrescent"
        case .crescent:
            return "Crescent"
        }
    }
}
