import UIKit

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

extension UIColor {
    convenience init(hex: Int, alpha: CGFloat = 1) {
        self.init(
            red: CGFloat(UInt8(hex >> 16 & 0xFF)) / 255,
            green: CGFloat(UInt8(hex >> 8 & 0xFF)) / 255,
            blue: CGFloat(UInt8(hex & 0xFF)) / 255,
            alpha: alpha
        )
    }
}

extension UIViewController {
    func addChild(_ controller: UIViewController, in containerView: UIView) {
        self.addChild(controller)
        containerView.addSubview(controller.view)
        controller.view.fillConstraintsToSuperview()
        controller.didMove(toParent: self)
    }
    
    func removeFromParentController() {
        self.willMove(toParent: nil)
        self.view.removeFromSuperview()
        self.removeFromParent()
    }
}

extension UIView {
    func fillConstraintsToSuperview(_ multiplier: CGFloat = 1) {
        guard let superview = self.superview else { return }
        
        translatesAutoresizingMaskIntoConstraints = false
        NSLayoutConstraint.activate([
            self.centerXAnchor.constraint(equalTo: superview.centerXAnchor),
            self.centerYAnchor.constraint(equalTo: superview.centerYAnchor),
            self.widthAnchor.constraint(equalTo: superview.widthAnchor, multiplier: multiplier),
            self.heightAnchor.constraint(equalTo: superview.heightAnchor, multiplier: multiplier),
            ])
    }
}
