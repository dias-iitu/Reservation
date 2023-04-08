//
//  UIStackViewHelper.swift
//  ReservationApp
//
//  Created by Niyazov Makhmujan on 07.04.2023.
//

import Foundation
import UIKit

extension UIStackView {

    convenience init(distribution: UIStackView.Distribution,
                     axis: NSLayoutConstraint.Axis,
                     spacing: CGFloat,
                     alighment: UIStackView.Alignment) {
        self.init(frame: .zero)
        self.axis = axis
        self.distribution = distribution
        self.spacing = spacing
        self.alignment = alighment
        self.translatesAutoresizingMaskIntoConstraints = false
    }
}
