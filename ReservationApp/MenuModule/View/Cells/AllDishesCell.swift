import UIKit
import Kingfisher

class AllDishesCell: UICollectionViewCell {

    static let allDishesId = "allDishesId"
    var count = 0
    
    var incrementCount: ((Int) -> ())?
    var decrementCount: ((Int) -> ())?
    
    private let incrementButtonStack = UIStackView(
        distribution: .fillEqually,
        axis: .horizontal,
        spacing: 2,
        alighment: .center
    )
    
    private let ratingStack = UIStackView(
        distribution: .fillEqually,
        axis: .horizontal,
        spacing: 2,
        alighment: .center
    )
    
    private let dishRatingStar = UIImageView(image: #imageLiteral(resourceName: "star"), contentMode: .scaleAspectFill)
    private let dishRatingCount = UILabel(
        title: "",
        alignment: .left,
        textColor: .black,
        font: .systemFont(ofSize: 12),
        lineBreakMode: .byWordWrapping,
        numberOfLines: 0
    )
    
    private let plusButton = UIButton(backgroundImage: #imageLiteral(resourceName: "plus"))
    
    private let incrementButton = UIButton(backgroundImage: #imageLiteral(resourceName: "plus"))
    private let decrementButton = UIButton(backgroundImage: UIImage(named: "minus")!)
    private let dishCountTitle = UILabel(
        title: "",
        alignment: .center,
        textColor: .black,
        font: .boldSystemFont(ofSize: 16),
        lineBreakMode: .byWordWrapping,
        numberOfLines: 0
    )
    
    let dishImage = UIImageView(image: #imageLiteral(resourceName: "star"), contentMode: .scaleAspectFill)
    private let dishName = UILabel(
        title: "",
        alignment: .left,
        textColor: .black,
        font: .systemFont(ofSize: 14),
        lineBreakMode: .byWordWrapping,
        numberOfLines: 0
    )
    
    private let dishPriceCount = UILabel(
        title: "",
        alignment: .left,
        textColor: .black,
        font: .boldSystemFont(ofSize: 16),
        lineBreakMode: .byWordWrapping,
        numberOfLines: 0
    )
  
    override init(frame: CGRect) {
        super.init(frame: frame)
        setupLayout()
        setupTargets()
        incrementButtonStack.isHidden = true
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    private func setupTargets() {
        incrementButton.addTarget(self, action: #selector(addCount), for: .touchUpInside)
        decrementButton.addTarget(self, action: #selector(removeCount), for: .touchUpInside)
        plusButton.addTarget(self, action: #selector(startAddCount), for: .touchUpInside)
    }
    
    @objc private func startAddCount() {
        count += 1
        dishCountTitle.text = "\(count)"
        plusButton.isHidden = true
        incrementButtonStack.isHidden = false
        incrementCount?(count)
    }
    
    @objc private func addCount() {
        count += 1
        dishCountTitle.text = "\(count)"
        incrementCount?(count)
    }

    @objc private func removeCount() {
        count -= 1
        dishCountTitle.text = "\(count)"
        if count == 0 {
            incrementButtonStack.isHidden = true
            plusButton.isHidden = false
        }
        
        decrementCount?(count)
    }
    
    private func setupLayout() {
        [dishImage, dishName, dishPriceCount, ratingStack, plusButton, incrementButtonStack].forEach { contentView.addSubview($0) }
        [dishRatingStar, dishRatingCount].forEach { ratingStack.addArrangedSubview($0) }
        [decrementButton, dishCountTitle, incrementButton].forEach { incrementButtonStack.addArrangedSubview($0) }
        
        NSLayoutConstraint.activate([
            dishImage.centerYAnchor.constraint(equalTo: contentView.centerYAnchor),
            dishImage.leadingAnchor.constraint(equalTo: contentView.leadingAnchor),
            dishImage.widthAnchor.constraint(equalToConstant: 110),
        
            dishName.topAnchor.constraint(equalTo: contentView.topAnchor, constant: 13),
            dishName.leadingAnchor.constraint(equalTo: dishImage.trailingAnchor, constant: 16),
            dishName.trailingAnchor.constraint(equalTo: contentView.trailingAnchor, constant: -16),
            
            dishPriceCount.topAnchor.constraint(equalTo: dishName.bottomAnchor, constant: 10),
            dishPriceCount.leadingAnchor.constraint(equalTo: dishImage.trailingAnchor, constant: 16),
            dishPriceCount.heightAnchor.constraint(equalToConstant: 20),
            
            ratingStack.topAnchor.constraint(equalTo: dishName.bottomAnchor, constant: 10),
            ratingStack.leadingAnchor.constraint(equalTo: dishPriceCount.trailingAnchor, constant: 16),
            ratingStack.heightAnchor.constraint(equalToConstant: 20),
            
            plusButton.topAnchor.constraint(equalTo: ratingStack.bottomAnchor, constant: 8),
            plusButton.leadingAnchor.constraint(equalTo: dishImage.trailingAnchor, constant: 16),
            plusButton.heightAnchor.constraint(equalToConstant: 24),
            plusButton.widthAnchor.constraint(equalToConstant: 24),
            plusButton.bottomAnchor.constraint(equalTo: contentView.bottomAnchor),
            
            incrementButtonStack.topAnchor.constraint(equalTo: ratingStack.bottomAnchor, constant: 8),
            incrementButtonStack.leadingAnchor.constraint(equalTo: dishImage.trailingAnchor, constant: 16),
            incrementButtonStack.bottomAnchor.constraint(equalTo: contentView.bottomAnchor),
           // incrementButtonStack.heightAnchor.constraint(equalToConstant: 56),
            incrementButtonStack.widthAnchor.constraint(equalToConstant: 80)
        ])
    }
    
    func configure(with model: MenuItem) {
        dishName.text = model.dishName
        dishPriceCount.text = String(model.dishPrice) + " \u{20B8}"
        dishRatingCount.text = String(model.dishRating)
        let imageUrl = URL(string: model.dishImage)
        dishImage.kf.setImage(with: imageUrl)
    }
}
