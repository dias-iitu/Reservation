import UIKit

class MenuViewController: UIViewController {
    
    private let sectionsName = ["", "Категории", "Все блюда"]
    private let viewModel = MenuViewModel()
    private let searchView = UIView(backgroundColor: .white)
    
    private let menuCollectionView: UICollectionView = {
        let layout = UICollectionViewLayout()
        let collectionView = UICollectionView(frame: .zero, collectionViewLayout: layout)
        collectionView.backgroundColor = .none
        collectionView.showsVerticalScrollIndicator = false
        collectionView.translatesAutoresizingMaskIntoConstraints = false
        return collectionView
    }()
    
    private let searchTextField = UITextField(
        placeholder: "Поиск",
        borderColor: #colorLiteral(red: 0.8392155766, green: 0.8392158151, blue: 0.843521297, alpha: 1),
        typeMode: .default,
        secureType: false,
        cornerRadius: 15
    )
    
    private lazy var settingsButton: UIButton = {
        let button = UIButton()
        button.setImage(UIImage(named: "filterBtn"), for: .normal)
        button.translatesAutoresizingMaskIntoConstraints = false
        return button
    }()
  
    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .white
        setupViewModel()
        registerCells()
        registerHeaders()
        setupDataSourceAndDelegate()
        setupLayout()
        setupCompositionalLayout()
        searchTextField.setIcon(UIImage(named: "magnifyingGlass")!)
    }
 
    @objc private func moveToSettings() {
        print("ok")
    }
    
    private func setupViewModel() {
        viewModel.reloadData = { [weak self] in
            DispatchQueue.main.async {
                self?.menuCollectionView.reloadData()
            }
        }
        viewModel.fetchCategoryItems()
        viewModel.getAllDishes()
    }
    
    private func setupCompositionalLayout() {
        let layout = UICollectionViewCompositionalLayout { section, layoutEnvironment in
            switch section {
            case 0:
                return CompositionalLayout.shared.bannerSection()
            case 1:
                return CompositionalLayout.shared.categorySection()
            default:
                return CompositionalLayout.shared.restaurantsListSection()
            }
        }
        
        layout.register(SectionDecorationView.self, forDecorationViewOfKind: "SectionBackground")
        menuCollectionView.setCollectionViewLayout(layout, animated: true)
    }
    
    private func registerCells() {
        menuCollectionView.register(BannerCell.self, forCellWithReuseIdentifier: BannerCell.bannerId)
        menuCollectionView.register(CategoriesCell.self, forCellWithReuseIdentifier: CategoriesCell.categoriesId)
        menuCollectionView.register(AllDishesCell.self, forCellWithReuseIdentifier: AllDishesCell.allDishesId)
    }
    
    private func registerHeaders() {
        menuCollectionView.register(
            CategoriesHeader.self,
            forSupplementaryViewOfKind: "Header",
            withReuseIdentifier: CategoriesHeader.categoriesHeaderId
        )
        
        menuCollectionView.register(
            AllDishesHeader.self,
            forSupplementaryViewOfKind: "Header",
            withReuseIdentifier: AllDishesCell.allDishesId)
    }
    
    private func setupDataSourceAndDelegate() {
        menuCollectionView.dataSource = self
        menuCollectionView.delegate = self
    }
    
    private func setupLayout() {
        [searchView, menuCollectionView].forEach { view.addSubview($0) }
        [searchTextField, settingsButton].forEach { searchView.addSubview($0) }
        
        NSLayoutConstraint.activate([
            searchView.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor),
            searchView.leadingAnchor.constraint(equalTo: view.leadingAnchor),
            searchView.trailingAnchor.constraint(equalTo: view.trailingAnchor),
            searchView.heightAnchor.constraint(equalToConstant: 70),
            
            menuCollectionView.topAnchor.constraint(equalTo: searchView.bottomAnchor),
            menuCollectionView.leadingAnchor.constraint(equalTo: view.leadingAnchor),
            menuCollectionView.trailingAnchor.constraint(equalTo: view.trailingAnchor),
            menuCollectionView.bottomAnchor.constraint(equalTo: view.bottomAnchor),
            
            searchTextField.topAnchor.constraint(equalTo: searchView.topAnchor, constant: 10),
            searchTextField.leadingAnchor.constraint(equalTo: searchView.leadingAnchor, constant: 16),
            searchTextField.bottomAnchor.constraint(equalTo: searchView.bottomAnchor, constant: -10),
            
            settingsButton.centerYAnchor.constraint(equalTo: searchView.centerYAnchor),
            settingsButton.leadingAnchor.constraint(equalTo: searchTextField.trailingAnchor, constant: 16),
            settingsButton.trailingAnchor.constraint(equalTo: searchView.trailingAnchor, constant: -16),
            settingsButton.heightAnchor.constraint(equalToConstant: 24),
            settingsButton.widthAnchor.constraint(equalToConstant: 24)
        ])
    }
}

extension MenuViewController: UICollectionViewDataSource {
    
    func numberOfSections(in collectionView: UICollectionView) -> Int {
        return 3
    }
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        switch section {
        case 0:
            return viewModel.bannerModels.count
        case 1:
            return viewModel.categoryModels.count
        default:
            return viewModel.allDishesModel.count
        }
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        switch indexPath.section {
        case 0:
            guard let cell = collectionView.dequeueReusableCell(
                withReuseIdentifier: BannerCell.bannerId,
                for: indexPath) as? BannerCell else { return UICollectionViewCell() }
            cell.dataCell = viewModel.bannerModels[indexPath.row]
            return cell
        case 1:
            guard let cell = collectionView.dequeueReusableCell(
                withReuseIdentifier: CategoriesCell.categoriesId,
                for: indexPath) as? CategoriesCell else { return UICollectionViewCell() }
            cell.dataCell = viewModel.categoryModels[indexPath.row]
            return cell
        default:
            guard let cell =  collectionView.dequeueReusableCell(
                withReuseIdentifier: AllDishesCell.allDishesId,
                for: indexPath) as? AllDishesCell else { return UICollectionViewCell() }
           // cell.model = viewModel.allDishesModel[indexPath.row]
            cell.configure(with: viewModel.allDishesModel[indexPath.row])
            return cell
        }
    }
}

extension MenuViewController: UICollectionViewDelegate {
    func collectionView(_ collectionView: UICollectionView, viewForSupplementaryElementOfKind kind: String, at indexPath: IndexPath) -> UICollectionReusableView {
        if kind == "Header" {
            switch indexPath.section {
            case 1:
                let categoriesHeader = collectionView.dequeueReusableSupplementaryView(ofKind: kind, withReuseIdentifier: CategoriesHeader.categoriesHeaderId, for: indexPath) as! CategoriesHeader
                return categoriesHeader
            default:
                let allDishesHeader = collectionView.dequeueReusableSupplementaryView(ofKind: kind, withReuseIdentifier: AllDishesHeader.allDishesId, for: indexPath) as! AllDishesHeader
                return allDishesHeader
            }
        }
        
        return UICollectionReusableView()
    }
}
