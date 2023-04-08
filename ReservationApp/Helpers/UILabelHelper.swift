//
//  UILabelHelper.swift
//  ReservationApp
//
//  Created by Niyazov Makhmujan on 06.04.2023.
//

import Foundation
import UIKit

extension UILabel {
    
    convenience init(title: String,
                     alignment: NSTextAlignment,
                     textColor: UIColor,
                     font: UIFont,
                     lineBreakMode: NSLineBreakMode,
                     numberOfLines: Int) {
        self.init(frame: .zero)
        self.text = title
        self.textAlignment = alignment
        self.textColor = textColor
        self.font = font
        self.lineBreakMode = lineBreakMode
        self.numberOfLines = numberOfLines
        self.translatesAutoresizingMaskIntoConstraints = false
    }
}
