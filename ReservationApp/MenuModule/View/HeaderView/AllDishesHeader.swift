//
//  AllDishesHeader.swift
//  ReservationApp
//
//  Created by Niyazov Makhmujan on 15.04.2023.
//

import UIKit

class AllDishesHeader: UICollectionReusableView {
    
    static let allDishesId = "allDishesId"
    
    private let allDishesTitle = UILabel(
        title: "Все блюда",
        alignment: .left,
        textColor: .black,
        font: .boldSystemFont(ofSize: 16),
        lineBreakMode: .byWordWrapping,
        numberOfLines: 0
    )
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        setupLayout()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    private func setupLayout() {
        addSubview(allDishesTitle)
        
        NSLayoutConstraint.activate([
            allDishesTitle.centerYAnchor.constraint(equalTo: centerYAnchor),
            allDishesTitle.leadingAnchor.constraint(equalTo: leadingAnchor)
        ])
    }
    
}
