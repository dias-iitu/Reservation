import UIKit

class MenuViewController: UIViewController {
    
    private let sectionsName = ["Категории", "Все блюда"]
    private let viewModel = MenuViewModel()
    
    private let menuTableView: UITableView = {
        let tableView = UITableView()
        tableView.backgroundColor = .white
        tableView.translatesAutoresizingMaskIntoConstraints = false
        return tableView
    }()
    
    private let searchView: UISearchController = {
        let search = UISearchController()
        search.searchBar.placeholder = "Поиск"
        search.searchBar.setImage(UIImage(named: "magnifyingGlass"), for: .search, state: .normal)
        return search
    }()
    
    private lazy var settingsButton: UIButton = {
        let button = UIButton()
        button.setImage(UIImage(named: "filterBtn"), for: .normal)
        button.translatesAutoresizingMaskIntoConstraints = false
        return button
    }()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .white
        setupDataSourceAndDelegate()
        setupLayout()
        setupNavBar()
        registerCells()
        viewModel.fetchCategoryItems { [weak self] in
            DispatchQueue.main.async {
                self?.menuTableView.reloadData()
            }
        }
    }
    
    private func setupNavBar() {
        navigationItem.titleView = searchView.searchBar
        navigationController?.navigationBar.isHidden = false
        navigationItem.setHidesBackButton(true, animated: true)
        navigationItem.rightBarButtonItem = UIBarButtonItem(
            image: UIImage(named: "filterBtn"),
            style: .done, target: self, action: #selector(moveToSettings))
        navigationItem.rightBarButtonItem?.tintColor = .black
        
    }
    
    @objc private func moveToSettings() {
        print("ok")
    }
    
    private func registerCells() {
        menuTableView.register(MenuHeader.self,
                               forHeaderFooterViewReuseIdentifier: MenuHeader.headerId)
        menuTableView.register(CategoryCell.self,
                               forCellReuseIdentifier: CategoryCell.categoryId)
    }
    
    private func setupDataSourceAndDelegate() {
        menuTableView.dataSource = self
        menuTableView.delegate = self
    }
    
    private func setupLayout() {
        view.addSubview(menuTableView)
        
        NSLayoutConstraint.activate([
            menuTableView.topAnchor.constraint(equalTo: view.topAnchor),
            menuTableView.leadingAnchor.constraint(equalTo: view.leadingAnchor),
            menuTableView.trailingAnchor.constraint(equalTo: view.trailingAnchor),
            menuTableView.bottomAnchor.constraint(equalTo: view.bottomAnchor)
        ])
        
    }

}

extension MenuViewController: UITableViewDataSource {
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return sectionsName[section].count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        if indexPath.row == 0 {
            guard let cell = tableView.dequeueReusableCell(withIdentifier: CategoryCell.categoryId,
                 
                                                           for: indexPath) as? CategoryCell else { return UITableViewCell() }
            cell.model = viewModel.model
            return cell
        }
        
        return UITableViewCell()
    }
}

extension MenuViewController: UITableViewDelegate {
    
    func tableView(_ tableView: UITableView, viewForHeaderInSection section: Int) -> UIView? {
        guard let header = tableView.dequeueReusableHeaderFooterView(withIdentifier: MenuHeader.headerId) else { return UITableViewHeaderFooterView() }
        return header
    }
    
    func tableView(_ tableView: UITableView, heightForHeaderInSection section: Int) -> CGFloat {
        return 150
    }
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        if indexPath.row == 0 {
            return 150
        }
        
        return 0
    }
}
