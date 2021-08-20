//
//  UIColor.swift
//  VIPER_Project
//
//  Created by Denis Golovizin on 18.08.2021.
//

import Foundation
import UIKit

extension UIColor {
    static var firstButton: UIColor {
        return UIColor.orange.withAlphaComponent(0.5)
    }

    static var secondButton: UIColor {
        return UIColor.yellow.withAlphaComponent(0.5)
    }

    static var preview: UIColor {
        return UIColor.black.withAlphaComponent(0.8)
    }

    static var urlTextField: UIColor {
        return UIColor.gray.withAlphaComponent(0.5)
    }
}
