import Foundation
import UIKit

class ReservationEmptyView: UIView {
    
    var moveToReservationAction: (() -> Void)?
    
    private let reservationEmptyViewImage = UIImageView(image: UIImage(named: "reservationEmpty")!, contentMode: .scaleAspectFill)
    private let reservationEmptyViewLabel = UILabel(
        title: "У вас нет ближайшей брони",
        alignment: .center,
        textColor: .black,
        font: .systemFont(ofSize: 16),
        lineBreakMode: .byWordWrapping,
        numberOfLines: 0
    )
    private let reservationEmptyViewButton = UIButton(
        title: "Забронировать столик",
        backgroundColor: #colorLiteral(red: 0.6706767678, green: 0.112393342, blue: 0.1214761063, alpha: 1),
        titleColor: .white,
        cornerRadius: 15
    )
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        setupLayout()
        setupTarget()
    }

    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    private func setupLayout() {
        [reservationEmptyViewImage, reservationEmptyViewLabel, reservationEmptyViewButton].forEach { addSubview($0) }
        
        NSLayoutConstraint.activate([
            reservationEmptyViewImage.centerYAnchor.constraint(equalTo: centerYAnchor),
            reservationEmptyViewImage.centerXAnchor.constraint(equalTo: centerXAnchor),
            reservationEmptyViewImage.heightAnchor.constraint(equalToConstant: 140),
            reservationEmptyViewImage.widthAnchor.constraint(equalToConstant: 188),
            
            reservationEmptyViewLabel.topAnchor.constraint(equalTo: reservationEmptyViewImage.bottomAnchor, constant: 24),
            reservationEmptyViewLabel.centerXAnchor.constraint(equalTo: centerXAnchor),
            reservationEmptyViewLabel.widthAnchor.constraint(equalToConstant: 216),
            
            reservationEmptyViewButton.topAnchor.constraint(equalTo: reservationEmptyViewLabel.bottomAnchor, constant: 24),
            reservationEmptyViewButton.leadingAnchor.constraint(equalTo: leadingAnchor, constant: 16),
            reservationEmptyViewButton.trailingAnchor.constraint(equalTo: trailingAnchor, constant: -16),
            reservationEmptyViewButton.heightAnchor.constraint(equalToConstant: 45)
        ])
    }
    
    private func setupTarget() {
        reservationEmptyViewButton.addTarget(self, action: #selector(moveToReservation), for: .touchUpInside)
    }
    
    @objc private func moveToReservation() {
        moveToReservationAction?()
    }
}
