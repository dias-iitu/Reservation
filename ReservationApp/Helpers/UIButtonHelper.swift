//
//  UIButtonHelper.swift
//  ReservationApp
//
//  Created by Niyazov Makhmujan on 07.04.2023.
//

import Foundation
import UIKit

extension UIButton {
    convenience init(backgroundImage: UIImage) {
        self.init(frame: .zero)
        self.setBackgroundImage(backgroundImage, for: .normal)
        self.translatesAutoresizingMaskIntoConstraints = false
    }
    
    convenience init(title: String, titleColor: UIColor) {
        self.init(frame: .zero)
        self.setTitle(title, for: .normal)
        self.setTitleColor(titleColor, for: .normal)
        self.titleLabel?.font = .systemFont(ofSize: 14)
        self.translatesAutoresizingMaskIntoConstraints = false
    }
    
    convenience init(title: String,
                     backgroundColor: UIColor,
                     titleColor: UIColor,
                     cornerRadius: CGFloat) {
        self.init(frame: .zero)
        self.setTitle(title, for: .normal)
        self.backgroundColor = backgroundColor
        self.setTitleColor(titleColor, for: .normal)
        self.layer.cornerRadius = cornerRadius
        self.translatesAutoresizingMaskIntoConstraints = false
    }
}
