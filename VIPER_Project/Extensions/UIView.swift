//
//  UIView.swift
//  VIPER_Project
//
//  Created by Denis Golovizin on 18.08.2021.
//

import Foundation
import UIKit

extension UIView {
    func defaultLayerConfig(borderWidth: CGFloat, cornerRadius: CGFloat) {
        self.layer.cornerRadius = cornerRadius
        self.layer.borderWidth = borderWidth
        self.layer.borderColor = UIColor.black.cgColor
        self.layer.masksToBounds = true
    }
}
