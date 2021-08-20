//
//  ButtonFActory.swift
//  VIPER_Project
//
//  Created by Denis Golovizin on 18.08.2021.
//

import Foundation
import UIKit

struct ButtonStyle {
    var height: CGFloat
    var color: UIColor
    var image: UIImage
    var title: String?

    static let acceptButtonStyle = ButtonStyle(height: 100,
                                               color: UIColor.secondButton,
                                               image: InterfaceIconsEnum.acceptButton.image!,
                                               title: NSLocalizedString("acceptButton",
                                                                        comment: "Accept button title"))

    static let enterUrlButtonStyle = ButtonStyle(height: 50,
                                                 color: UIColor.firstButton,
                                                 image: InterfaceIconsEnum.enterUrlButton.image!,
                                                 title: nil)
}

final class ButtonFactory {

    static func buildAcceptButton() -> UIButton {
        return buildButton(with: .acceptButtonStyle)
    }

    static func buildEnterUrlButton() -> UIButton {
        return buildButton(with: .enterUrlButtonStyle)
    }

    static func buildButton(with config: ButtonStyle) -> UIButton {
        let button = UIButton()

        button.backgroundColor = config.color
        button.setImage(config.image, for: .normal)
        button.setTitle(config.title, for: .normal)
        button.setTitleColor(UIColor.black, for: .normal)
        button.titleLabel?.font = UIFont.systemFont(ofSize: 20, weight: UIFont.Weight(2))
        button.configureLayer(borderWidth: 4, cornerRadius: config.height / 2)

        NSLayoutConstraint.activate([
            button.heightAnchor.constraint(equalToConstant: config.height),
            button.widthAnchor.constraint(equalToConstant: config.height)
        ])

        return button
    }
}
