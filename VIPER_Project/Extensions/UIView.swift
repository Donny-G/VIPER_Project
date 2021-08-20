//
//  UIView.swift
//  VIPER_Project
//
//  Created by Denis Golovizin on 18.08.2021.
//

import Foundation
import UIKit

extension UIView {
    func configureLayer(borderWidth: CGFloat, cornerRadius: CGFloat) {
        self.layer.cornerRadius = cornerRadius
        self.layer.borderWidth = borderWidth
        self.layer.borderColor = UIColor.black.cgColor
        self.layer.masksToBounds = true
    }

    enum Edge {
        case top
        case bottom
        case left(offset: CGFloat = 0)
        case right(offset: CGFloat = 0)
    }

    func pin(edges: [Edge], target: UIView) {
        for edge in edges {
            switch edge {
            case .top:
                self.topAnchor.constraint(equalTo: target.safeAreaLayoutGuide.topAnchor).isActive = true
            case .bottom:
                self.bottomAnchor.constraint(equalTo: target.safeAreaLayoutGuide.bottomAnchor).isActive = true
            case .left(let offset):
                self.leadingAnchor.constraint(equalTo: target.safeAreaLayoutGuide.leadingAnchor,
                                              constant: offset).isActive = true
            case .right(let offset):
                self.trailingAnchor.constraint(equalTo: target.safeAreaLayoutGuide.trailingAnchor,
                                               constant: offset).isActive = true
            }
        }
    }
}
