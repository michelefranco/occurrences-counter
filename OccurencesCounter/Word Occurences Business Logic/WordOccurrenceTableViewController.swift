import UIKit

final class WordOccurrenceTableViewController: UITableViewController {
    private var model = [WordOccurence]()
    private let reuseIdentifier = "OccurencesTableViewCellIdentifier"
    
    
    //MARK: UIViewController's life cycle
    
    convenience init() {
        self.init(with: [WordOccurence]())
    }
    
    init(with model: [WordOccurence]) {
        self.model = model
        super.init(style: .plain)
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        self.tableView.register(UITableViewCell.self, forCellReuseIdentifier: self.reuseIdentifier)
        self.tableView.allowsSelection = false
    }
    
    //MARK: Methods
    
    func reload(with model: [WordOccurence]) {
        self.model = model
        
        self.tableView.reloadSections([0], with: .automatic)
        self.tableView.scrollToRow(at: IndexPath(item: 0, section: 0), at: .top, animated: false)
    }
    
    // MARK: UITableView's Datasource
    
    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        // #warning Incomplete implementation, return the number of rows
        return self.model.count
    }
    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = UITableViewCell(style: .subtitle, reuseIdentifier: self.reuseIdentifier)
        
        let item = self.model[indexPath.item]
        
        cell.textLabel?.text = item.word
        if item.occurence.isPrime {
            cell.detailTextLabel?.text = "PRIME NUMBER"
            cell.detailTextLabel?.textColor = UIColor(hex: 0x00CC00)
        } else {
            cell.detailTextLabel?.text = "COMPOSITE NUMBER"
            cell.detailTextLabel?.textColor = .red
        }
        
        let occurenceLabel = UILabel()
        occurenceLabel.text = "\(item.occurence)"
        occurenceLabel.sizeToFit()
        cell.accessoryView = occurenceLabel
        
        return cell
    }
}
