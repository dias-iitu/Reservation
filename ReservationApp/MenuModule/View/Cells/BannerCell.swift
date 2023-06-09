//
//  BannerCell.swift
//  ReservationApp
//
//  Created by Niyazov Makhmujan on 15.04.2023.
//

import UIKit

class BannerCell: UICollectionViewCell {
    
    static let bannerId = "bannerId"
    
    private let mainView = UIView(backgroundColor: #colorLiteral(red: 1, green: 0.8247188926, blue: 0.8239497542, alpha: 1))
    
    var dataCell: BannerInfo? {
        didSet {
            guard let dataCell = dataCell else { return }
            specialLabel.text = dataCell.specialLabel
            specialDescLabel.text = dataCell.specialDescLabel
            kettleImage.image = UIImage(named: dataCell.kettleImage)
        }
    }
    
    private let mainStack = UIStackView(
        distribution: .fill,
        axis: .vertical,
        spacing: 2,
        alighment: .leading
    )
    
    private let specialLabel = UILabel(
        title: "",
        alignment: .left,
        textColor: .red,
        font: .systemFont(ofSize: 12),
        lineBreakMode: .byCharWrapping,
        numberOfLines: 0
    )
    
    private let specialDescLabel = UILabel(
        title: "",
        alignment: .left,
        textColor: .black,
        font: .boldSystemFont(ofSize: 14),
        lineBreakMode: .byWordWrapping,
        numberOfLines: 0
    )
    
    private let kettleImage: UIImageView = {
        let kettle = UIImageView()
        kettle.image = nil
        kettle.contentMode = .scaleAspectFill
        kettle.translatesAutoresizingMaskIntoConstraints = false
        return kettle
    }()
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        setupMainView()
        setupLayout()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    private func setupMainView() {
        mainView.layer.cornerRadius = 15
    }
    
    private func setupLayout() {
        contentView.addSubview(mainView)
        [mainStack, kettleImage].forEach { mainView.addSubview($0) }
        [specialLabel, specialDescLabel].forEach { mainStack.addArrangedSubview($0) }
        
        NSLayoutConstraint.activate([
            mainView.topAnchor.constraint(equalTo: contentView.topAnchor, constant: 20),
            mainView.leadingAnchor.constraint(equalTo: contentView.leadingAnchor, constant: 16),
            mainView.trailingAnchor.constraint(equalTo: contentView.trailingAnchor, constant: -16),
            mainView.bottomAnchor.constraint(equalTo: contentView.bottomAnchor, constant: -20),
            
            mainStack.topAnchor.constraint(equalTo: mainView.topAnchor),
            mainStack.leadingAnchor.constraint(equalTo: mainView.leadingAnchor, constant: 16),
            mainStack.bottomAnchor.constraint(equalTo: mainView.bottomAnchor, constant: -20),

            kettleImage.topAnchor.constraint(equalTo: mainView.topAnchor, constant: -20),
            kettleImage.trailingAnchor.constraint(equalTo: mainView.trailingAnchor, constant: 10),
            kettleImage.bottomAnchor.constraint(equalTo: mainView.bottomAnchor, constant: 35)
        ])
    }
}
