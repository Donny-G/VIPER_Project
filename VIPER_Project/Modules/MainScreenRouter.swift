//
//  MainScreenRouter.swift
//  VIPER_Project
//
//  Created by Denis Golovizin on 23.07.2021.
//

import Foundation
import UIKit

protocol MainScreenRouterProtocol: AnyObject {
    func presentDetailView(image: UIImage)
}

final class MainScreenRouter {
    var showImage: ((UIImage) -> Void)

    init(showImage: @escaping ((UIImage) -> Void)) {
        self.showImage = showImage
    }
}

// MARK: - MainScreenRouterProtocol
extension MainScreenRouter: MainScreenRouterProtocol {
    func presentDetailView(image: UIImage) {
        showImage(image)
    }
}
