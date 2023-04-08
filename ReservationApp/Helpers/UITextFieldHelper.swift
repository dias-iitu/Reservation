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
}
