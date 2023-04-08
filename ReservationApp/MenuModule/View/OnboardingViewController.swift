//
//  OnboardingViewController.swift
//  ReservationApp
//
//  Created by Niyazov Makhmujan on 08.04.2023.
//

import UIKit

class OnboardingViewController: UIViewController {

    private let mainImage = UIImageView(image: #imageLiteral(resourceName: "onboarding"), contentMode: .scaleAspectFill)
    private let mainView = UIView(borderColor: .clear, borderWidth: 0)
    private let welcomeTitle = UILabel(
        title: "Добро пожаловать",
        alignment: .left,
        textColor: .black,
        font: .boldSystemFont(ofSize: 24),
        lineBreakMode: .byCharWrapping,
        numberOfLines: 0
    )
    
    private let descTitle = UILabel(
        title: "Легко бронируйте столик и заранее\nзаказывайте изысканные блюда в нашем\nресторане",
        alignment: .left,
        textColor: .black,
        font: .systemFont(ofSize: 16),
        lineBreakMode: .byWordWrapping,
        numberOfLines: 0
    )
    
    private let reservationButton = UIButton(
        title: "Начать бронировать",
        backgroundColor: #colorLiteral(red: 0.6706767678, green: 0.112393342, blue: 0.1214761063, alpha: 1),
        titleColor: .white,
        cornerRadius: 15
    )
    
    private let mainStack = UIStackView(
        distribution: .fill,
        axis: .vertical,
        spacing: 0,
        alighment: .leading
    )
    
    override func viewDidLoad() {
        super.viewDidLoad()
        addElements()
        setupLayout()
        addTarget()
        mainView.backgroundColor = .white
    }
    
    private func addElements() {
        [mainImage, mainView].forEach { view.addSubview($0) }
        [mainStack, reservationButton].forEach { mainView.addSubview($0) }
        [welcomeTitle, descTitle].forEach { mainStack.addArrangedSubview($0) }
    }
    
    private func setupLayout() {
        NSLayoutConstraint.activate([
            mainImage.topAnchor.constraint(equalTo: view.topAnchor),
            mainImage.leadingAnchor.constraint(equalTo: view.leadingAnchor),
            mainImage.trailingAnchor.constraint(equalTo: view.trailingAnchor),
            
            mainView.topAnchor.constraint(equalTo: mainImage.bottomAnchor),
            mainView.leadingAnchor.constraint(equalTo: view.leadingAnchor),
            mainView.trailingAnchor.constraint(equalTo: view.trailingAnchor),
            mainView.bottomAnchor.constraint(equalTo: view.bottomAnchor),
            mainView.heightAnchor.constraint(equalToConstant: 238),
            
            welcomeTitle.heightAnchor.constraint(equalToConstant: 30),
            descTitle.heightAnchor.constraint(equalToConstant: 60),
            
            mainStack.topAnchor.constraint(equalTo: mainView.topAnchor, constant: 25),
            mainStack.leadingAnchor.constraint(equalTo: mainView.leadingAnchor, constant: 16),
            mainStack.trailingAnchor.constraint(equalTo: mainView.trailingAnchor, constant: -16),
            
            reservationButton.topAnchor.constraint(equalTo: mainStack.bottomAnchor, constant: 35),
            reservationButton.leadingAnchor.constraint(equalTo: mainView.leadingAnchor, constant: 16),
            reservationButton.trailingAnchor.constraint(equalTo: mainView.trailingAnchor, constant: -16),
            reservationButton.bottomAnchor.constraint(equalTo: mainView.bottomAnchor, constant: -20),
            reservationButton.heightAnchor.constraint(equalToConstant: 50)
        ])
    }
    
    private func addTarget() {
        reservationButton.addTarget(self, action: #selector(toReservation), for: .touchUpInside)
    }
    
    @objc private func toReservation() {
        let loginVC = LoginViewController()
        navigationController?.pushViewController(loginVC, animated: true)
    }


}
