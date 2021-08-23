//
//  UIControl.swift
//  VIPER_Project
//
//  Created by Denis Golovizin on 19.08.2021.
//

import Foundation
import UIKit

extension UIControl {
    func addTapAction(for event: UIControl.Event = .touchUpInside, handler: @escaping UIActionHandler) {
        self.addAction(UIAction(handler: handler), for: event)
    }

    func addTapEnterAction(for event: UIControl.Event = .editingDidEndOnExit, handler: @escaping UIActionHandler) {
        self.addAction(UIAction(handler: handler), for: event)
    }
}
