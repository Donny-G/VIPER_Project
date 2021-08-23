//
//  ImageViewFactory.swift
//  VIPER_Project
//
//  Created by Denis Golovizin on 19.08.2021.
//

import Foundation
import UIKit

struct ImageViewStyle {
    var color: UIColor

    static let previewImageStyle = ImageViewStyle(color: UIColor.preview)
}

final class ImageViewFactory {
    static func buildPreviewImageView() -> UIImageView {
        return buildImageView(with: .previewImageStyle)
    }

    static func buildImageView(with config: ImageViewStyle) -> UIImageView {
        let imageView = UIImageView()

        imageView.backgroundColor = config.color
        imageView.configureLayer(borderWidth: 2, cornerRadius: 20)

        return imageView
    }
}
