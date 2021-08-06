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

}

// MARK: - MainScreenRouterProtocol
extension MainScreenRouter: MainScreenRouterProtocol {
    func presentDetailView(image: UIImage) {
        guard let windowScene = UIApplication.shared.connectedScenes.first as? UIWindowScene,
              let sceneDelegate = windowScene.delegate as? SceneDelegate
        else {
            return
        }
        sceneDelegate.coordinator.showDetailView(with: image)
    }
}
