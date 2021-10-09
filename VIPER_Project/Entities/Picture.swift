//
//  PicturesDTO.swift
//  VIPER_Project
//
//  Created by Denis Golovizin on 27.08.2021.
//

import Foundation
import UIKit

class Picture {
    var identifier: UUID
    var title: String
    var image: UIImage

    init(title: String, image: UIImage, identifier: UUID) {
        self.title = title
        self.image = image
        self.identifier = identifier
    }
}
