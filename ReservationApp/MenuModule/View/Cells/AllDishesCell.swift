import UIKit
import Kingfisher

class AllDishesCell: UICollectionViewCell {
    
    static let allDishesId = "allDishesId"
    
    
//    var model: MenuItem? {
//        didSet {
//            guard let data = model else { return }
//            print("IMAGE1======\(data.dishImage)")
//            dishImage.kf.setImage(with: URL(string: data.dishImage))
//            print("KINGFisher ============ \(dishImage.kf.setImage(with: URL(string: data.dishImage)))")
//            print("IMAGE2======\(data.dishImage)")
//            dishName.text = data.dishName
//            dishPrice.text = String(data.dishPrice)
//            dishRatingCount.text = String(data.dishRating)
//        }
//    }
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
    
    private let dishPrice = UILabel(
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
        incrementButtonStack.isHidden = true
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }

    private func setupLayout() {
        [dishImage, dishName, dishPrice, ratingStack, plusButton, incrementButtonStack].forEach { contentView.addSubview($0) }
        [dishRatingStar, dishRatingCount].forEach { ratingStack.addArrangedSubview($0) }
        [incrementButton, dishCountTitle, decrementButton].forEach { incrementButtonStack.addArrangedSubview($0) }
        
        NSLayoutConstraint.activate([
            dishImage.centerYAnchor.constraint(equalTo: contentView.centerYAnchor),
            dishImage.leadingAnchor.constraint(equalTo: contentView.leadingAnchor),
            dishImage.widthAnchor.constraint(equalToConstant: 110),
        
            dishName.topAnchor.constraint(equalTo: contentView.topAnchor, constant: 13),
            dishName.leadingAnchor.constraint(equalTo: dishImage.trailingAnchor, constant: 16),
            dishName.trailingAnchor.constraint(equalTo: contentView.trailingAnchor, constant: -16),
            
            dishPrice.topAnchor.constraint(equalTo: dishName.bottomAnchor, constant: 10),
            dishPrice.leadingAnchor.constraint(equalTo: dishImage.trailingAnchor, constant: 16),
            dishPrice.heightAnchor.constraint(equalToConstant: 20),
            
            ratingStack.topAnchor.constraint(equalTo: dishName.bottomAnchor, constant: 10),
            ratingStack.leadingAnchor.constraint(equalTo: dishPrice.trailingAnchor, constant: 16),
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
            incrementButtonStack.widthAnchor.constraint(equalToConstant: 120)
        ])
    }
    
    func configure(with model: MenuItem) {
        dishName.text = model.dishName
        dishPrice.text = String(model.dishPrice)
        dishRatingCount.text = String(model.dishRating)
        let imageUrl = URL(string: model.dishImage)
        print("IMAGEURL ========== \(imageUrl)")
        dishImage.kf.setImage(with: imageUrl)
        print("IMAGE1======\(model.dishImage)")
        print("KINGFisher ============ \(dishImage.kf.setImage(with:imageUrl))")
    }
}
