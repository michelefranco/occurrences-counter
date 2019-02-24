import UIKit

final class TextbookViewController: UIViewController {
    @IBOutlet var bookTextView: UITextView!
    private var layoutIsSet = false
    
    init() {
        super.init(nibName: "Textbook", bundle: nil)
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    //MARK: UIViewController's life cycle
    override func viewDidLoad() {
        super.viewDidLoad()

        self.navigationController?.navigationBar.topItem?.title = "Text Book"
        
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
        
        
//        self.bookTextView.setContentOffset(.zero, animated: false)
    }
    
    @IBAction func convertPressed(_ sender: UIButton) {
    }
}

