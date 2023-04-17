//
//  CategoriesCell.swift
//  ReservationApp
//
//  Created by Niyazov Makhmujan on 15.04.2023.
//

import UIKit

class CategoriesCell: UICollectionViewCell {
    
    static let categoriesId = "categoriesId"
    
    var dataCell: ImageName? {
        didSet {
            guard let dataCell = dataCell else { return }
            categoryImage.image = UIImage(named: dataCell.imageName)
        }
    }
    
    let categoryImage: UIImageView = {
        let image = UIImageView()
        image.contentMode = .scaleAspectFill
        image.layer.cornerRadius = 15
        image.clipsToBounds = true
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
            categoryImage.leadingAnchor.constraint(equalTo: contentView.leadingAnchor, constant: 16),
            categoryImage.trailingAnchor.constraint(equalTo: contentView.trailingAnchor),
            categoryImage.bottomAnchor.constraint(equalTo: contentView.bottomAnchor)
        ])
    }
}
