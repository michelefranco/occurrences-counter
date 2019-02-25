import UIKit

final class WordOccurenceViewController: UIViewController {
    private let wordOccurenceTableViewController = WordOccurrenceTableViewController()
    private let orders: [Order] = [.decrescent, .crescent]
    private let occurencesManager: WordOccurenceManager
    
    @IBOutlet var segmentedControl: UISegmentedControl!
    @IBOutlet var containerTableView: UIView!

    init(with manager: WordOccurenceManager) {
        self.occurencesManager = manager
        super.init(nibName: "WordOccurence", bundle: nil)
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    // MARK: UIViewController's life cycle
    override func viewDidLoad() {
        super.viewDidLoad()
        
        self.title = "Occurences"
        
        self.orders.enumerated().forEach { index, order in
            self.segmentedControl.setTitle(order.description, forSegmentAt: index)
        }
        
        self.load(with: orders[0])
        
        self.addChild(wordOccurenceTableViewController, in: self.containerTableView)
        self.segmentedControl.addTarget(self, action: #selector(valueChanged(_:)), for: .valueChanged)
    }
    
    // Target Selectors
    
    @objc func valueChanged(_ sender: UISegmentedControl) {
        let order = self.orders[sender.selectedSegmentIndex]
        self.load(with: order)
    }
    
    private func load(with order: Order) {
        let occurences = self.occurencesManager.occurences(with: order)
        self.wordOccurenceTableViewController.reload(with: occurences)
    }
}
