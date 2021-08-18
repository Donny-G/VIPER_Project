//
//  ButtonFActory.swift
//  VIPER_Project
//
//  Created by Denis Golovizin on 18.08.2021.
//

import Foundation
import UIKit

final class ButtonFactory {
    struct ButtonStyle {
        var height: CGFloat
        var color: UIColor
        var image: UIImage
        var title: String?
    }

    static func buildButton(config: ButtonStyle) -> UIButton {
        let button = UIButton()
        button.backgroundColor = config.color
        button.setImage(config.image, for: .normal)
        button.setTitle(config.title, for: .normal)
        button.setTitleColor(UIColor.black, for: .normal)
        button.titleLabel?.font = UIFont.systemFont(ofSize: 20, weight: UIFont.Weight(2))

        button.defaultLayerConfig(borderWidth: 4, cornerRadius: config.height / 2)

        NSLayoutConstraint.activate([
            button.heightAnchor.constraint(equalToConstant: config.height),
            button.widthAnchor.constraint(equalToConstant: config.height)
        ])

        return button
    }
}
