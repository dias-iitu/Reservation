import UIKit

protocol ShowAllActionDelegate: AnyObject {
    func didTabShowAllBTN()
}

class CategoriesHeader: UICollectionReusableView {
        
    static let categoriesHeaderId = "categoriesHeaderId"
    
    private let categoriesTitle = UILabel(
        title: "Категории",
        alignment: .left,
        textColor: .black,
        font: .boldSystemFont(ofSize: 16),
        lineBreakMode: .byWordWrapping,
        numberOfLines: 0
    )
    
    private let showAllCategoriesButton = UIButton(
        title: "Смотреть все",
        backgroundColor: .clear,
        titleColor: .black,
        cornerRadius: 0
    )
    
    var leadingConstraints: NSLayoutConstraint?
    var trailingConstraints: NSLayoutConstraint?
    weak var delegate: ShowAllActionDelegate?
    
    var isSticky: Bool? {
        didSet {
            guard let isSticky = isSticky else {
                return
            }
            if isSticky {
                leadingConstraints?.constant = 17
                trailingConstraints?.constant = -17
            } else {
                leadingConstraints?.constant = 2
                trailingConstraints?.constant = -2
            }
        }
    }
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        setupLayout()
        showAllCategoriesButton.titleLabel?.font = .systemFont(ofSize: 14)
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    private func setupLayout() {
        [categoriesTitle, showAllCategoriesButton].forEach { addSubview($0) }
        
        NSLayoutConstraint.activate([
            categoriesTitle.centerYAnchor.constraint(equalTo: centerYAnchor),
            categoriesTitle.leadingAnchor.constraint(equalTo: leadingAnchor, constant: 16),
            
            showAllCategoriesButton.centerYAnchor.constraint(equalTo: centerYAnchor),
            showAllCategoriesButton.trailingAnchor.constraint(equalTo: trailingAnchor, constant: -16)
        ])
    }
}
