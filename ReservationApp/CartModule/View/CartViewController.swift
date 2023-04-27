import UIKit

class CartViewController: UIViewController {

    //private let viewModel = CartViewModel()
    
    private let cartTableView: UITableView = {
        let tableView = UITableView()
        tableView.translatesAutoresizingMaskIntoConstraints = false
        return tableView
    }()
    
    override func viewDidLoad() {
        super.viewDidLoad()

        view.backgroundColor = .red
    }
}
