import UIKit

final class WordOccurrenceViewController: UIViewController {
    private let wordOccurrenceTableViewController = WordOccurrenceTableViewController()
    private let orders: [Order] = [.decrescent, .crescent]
    private let occurrencesManager: WordOccurrenceManager
    
    @IBOutlet var segmentedControl: UISegmentedControl!
    @IBOutlet var containerTableView: UIView!

    init(with manager: WordOccurrenceManager) {
        self.occurrencesManager = manager
        super.init(nibName: "WordOccurrence", bundle: nil)
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    // MARK: UIViewController's life cycle
    override func viewDidLoad() {
        super.viewDidLoad()
        
        self.title = "Occurrences"
        
        self.orders.enumerated().forEach { index, order in
            self.segmentedControl.setTitle(order.description, forSegmentAt: index)
        }
        
        self.load(with: orders[0])
        
        self.addChild(wordOccurrenceTableViewController, in: self.containerTableView)
        self.segmentedControl.addTarget(self, action: #selector(valueChanged(_:)), for: .valueChanged)
    }
    
    // Target Selectors
    
    @objc func valueChanged(_ sender: UISegmentedControl) {
        let order = self.orders[sender.selectedSegmentIndex]
        self.load(with: order)
    }
    
    private func load(with order: Order) {
        let occurrences = self.occurrencesManager.occurrences(with: order)
        self.wordOccurrenceTableViewController.reload(with: occurrences)
    }
}
