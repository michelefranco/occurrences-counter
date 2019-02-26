import UIKit

final class TextbookViewController: UIViewController {
    @IBOutlet var bookTextView: UITextView!
    private var layoutIsSet = false
    
    //MARK: UIViewController's life cycle

    init() {
        super.init(nibName: "Textbook", bundle: nil)
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        self.title = "Text Book"
        
        if let bookURL = Bundle.main.url(forResource: "book", withExtension: "txt") {
            let text: String
            do {
                text = try String(contentsOf: bookURL)
            } catch {
                text =  error.localizedDescription
            }
            self.bookTextView.text = text
        }
    }
    
    override func viewDidLayoutSubviews() {
        super.viewDidLayoutSubviews()
        
        guard !self.layoutIsSet else { return }
        
        self.layoutIsSet = true
        self.bookTextView.setContentOffset(.zero, animated: false)
    }
    
    override func viewDidAppear(_ animated: Bool) {
        super.viewDidAppear(animated)
        
        self.bookTextView.flashScrollIndicators()
    }
    
    @IBAction func convertPressed(_ sender: UIButton) {
        if let text = self.bookTextView.text {
            let manager = WordOccurrenceReducer(text: text)
            let occurrencesViewController = WordOccurrenceViewController(with: manager)
            self.show(occurrencesViewController, sender: nil)
        }
    }
}
