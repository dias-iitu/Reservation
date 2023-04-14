//
//  MenuHeader.swift
//  ReservationApp
//
//  Created by Niyazov Makhmujan on 11.04.2023.
//

import UIKit

class MenuHeader: UITableViewHeaderFooterView {

    static let headerId = "headerId"
    
    private let mainView = UIView(backgroundColor: #colorLiteral(red: 1, green: 0.8247188926, blue: 0.8239497542, alpha: 1))
    
    private let mainStack = UIStackView(
        distribution: .fill,
        axis: .vertical,
        spacing: 2,
        alighment: .leading
    )
    
    private let specialLabel = UILabel(
        title: "Специальное предложение",
        alignment: .left,
        textColor: .red,
        font: .systemFont(ofSize: 12),
        lineBreakMode: .byCharWrapping,
        numberOfLines: 0
    )
    
    private let specialDescLabel = UILabel(
        title: "При заказе “Комбо меню 3”\nфирменный чай в подарок",
        alignment: .left,
        textColor: .black,
        font: .boldSystemFont(ofSize: 14),
        lineBreakMode: .byWordWrapping,
        numberOfLines: 0
    )
    
    private let kettleImage: UIImageView = {
        let kettle = UIImageView()
        kettle.image = #imageLiteral(resourceName: "kettle")
        kettle.contentMode = .scaleAspectFill
        kettle.translatesAutoresizingMaskIntoConstraints = false
        return kettle
    }()
    
    override init(reuseIdentifier: String?) {
        super.init(reuseIdentifier: reuseIdentifier)
        setupLayout()
        setupMainView()
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
