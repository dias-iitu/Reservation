//
//  UITextFieldHelper.swift
//  ReservationApp
//
//  Created by Niyazov Makhmujan on 07.04.2023.
//

import Foundation
import UIKit

extension UITextField {
    
    convenience init(
        placeholder: String,
        borderColor: UIColor,
        typeMode: UIKeyboardType,
        secureType: Bool,
        cornerRadius: CGFloat) {
        self.init(frame: .zero)
            let placeholder = NSAttributedString(string: placeholder, attributes: [NSAttributedString.Key.foregroundColor : UIColor.lightGray])
        self.attributedPlaceholder = placeholder
        self.textColor = .black
        self.layer.borderWidth = 1
        self.layer.borderColor = borderColor.cgColor
        self.font = .systemFont(ofSize: 16)
        self.isSecureTextEntry = secureType
        self.keyboardType = typeMode
        self.layer.cornerRadius = cornerRadius
        self.translatesAutoresizingMaskIntoConstraints = false
    }
    
    func setIcon(_ image: UIImage) {
       let iconView = UIImageView(frame:
                      CGRect(x: 10, y: 5, width: 20, height: 20))
       iconView.image = image
       let iconContainerView: UIView = UIView(frame:
                      CGRect(x: 20, y: 0, width: 30, height: 30))
       iconContainerView.addSubview(iconView)
       leftView = iconContainerView
       leftViewMode = .always
    }
}
