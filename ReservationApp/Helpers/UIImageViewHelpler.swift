//
//  UIImageViewHelpler.swift
//  ReservationApp
//
//  Created by Niyazov Makhmujan on 07.04.2023.
//

import Foundation
import UIKit

extension UIImageView {
    
    convenience init(image: UIImage, contentMode: UIView.ContentMode) {
        self.init(frame: .zero)
        self.image = image
        self.contentMode = contentMode
        self.translatesAutoresizingMaskIntoConstraints = false
    }
}
