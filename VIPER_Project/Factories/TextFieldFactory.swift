//
//  TextFieldFactory.swift
//  VIPER_Project
//
//  Created by Denis Golovizin on 19.08.2021.
//

import Foundation
import UIKit

struct TextFieldStyle {
    var color: UIColor
    var placeholder: String

    static let urlTextFieldStyle = TextFieldStyle(
        color: UIColor.urlTextField,
        placeholder: NSLocalizedString("urlTextFieldPlaceholder",
                                       comment: "Placeholder"))

    static let titleTextFieldStyle = TextFieldStyle(
        color: UIColor.urlTextField,
        placeholder: NSLocalizedString("titleTextFieldPlaceholder", comment: "Placeholder"))
}

final class TextFieldFactory {

    static func buildURLTextField() -> UITextField {
        return buildTextField(with: .urlTextFieldStyle)
    }

    static func buildTitleTextField() -> UITextField {
        return buildTextField(with: .titleTextFieldStyle)
    }

    static func buildTextField(with config: TextFieldStyle) -> UITextField {
        let textfield = UITextField()

        textfield.placeholder = config.placeholder
        textfield.font = UIFont.systemFont(ofSize: 20, weight: UIFont.Weight(5))
        textfield.textAlignment = .center
        textfield.backgroundColor = config.color
        textfield.configureLayer(borderWidth: 2, cornerRadius: 20)

        return textfield
    }
}
