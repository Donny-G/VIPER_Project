//
//  InterfaceIcons.swift
//  VIPER_Project
//
//  Created by Denis Golovizin on 14.08.2021.
//

import Foundation
import  UIKit

enum InterfaceIconsEnum: String {
    case enterUrlButton = "network"
    case acceptButton = "checkmark.shield.fill"
    case defaultImage = "questionmark.diamond"
    case errorImage = "eyes"

    var image: UIImage? {
        UIImage(systemName: self.rawValue)
    }
}
