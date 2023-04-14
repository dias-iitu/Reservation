//
//  CategoryCollectionCell.swift
//  ReservationApp
//
//  Created by Niyazov Makhmujan on 11.04.2023.
//

import UIKit

class CategoryCollectionCell: UICollectionViewCell {
    
    static let categoryCollectionCellId = "categoryCollectionCellId"
    
    private let categoryImage: UIImageView = {
        let image = UIImageView()
        image.contentMode = .scaleAspectFill
        image.translatesAutoresizingMaskIntoConstraints = false
        return image
    }()
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        setupLayout()
        backgroundColor = .white
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    private func setupLayout() {
        contentView.addSubview(categoryImage)
        
        NSLayoutConstraint.activate([
            categoryImage.topAnchor.constraint(equalTo: contentView.topAnchor),
            categoryImage.leadingAnchor.constraint(equalTo: contentView.leadingAnchor),
            categoryImage.trailingAnchor.constraint(equalTo: contentView.trailingAnchor),
            categoryImage.bottomAnchor.constraint(equalTo: contentView.bottomAnchor)
        ])
    }
    
    func configure(with model: Category) {
        categoryImage.image = UIImage(named: model.imageName)
    }
}
