import UIKit

class WorldOccurrenceTableViewController: UITableViewController {
    private let model: [WordOccurence]
    private let reuseIdentifier = "OccurencesTableViewCellIdentifier"
    init(with model: [WordOccurence]) {
        self.model = model
        super.init(style: .plain)
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        self.title = "Occurences"
        self.tableView.register(UITableViewCell.self, forCellReuseIdentifier: self.reuseIdentifier)
        
        self.tableView.allowsSelection = false
    }
    // MARK: - Table view data source
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
