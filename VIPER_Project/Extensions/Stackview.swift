//
//  Stackview.swift
//  VIPER_Project
//
//  Created by Denis Golovizin on 18.08.2021.
//

import Foundation
import UIKit

extension UIStackView {
    func config(axis: NSLayoutConstraint.Axis ) {
        self.axis = axis
        self.distribution = .fill
        self.alignment = .fill
        self.spacing = 10
        self.translatesAutoresizingMaskIntoConstraints = false
    }
}
