//
//  MainCoordinator.swift
//  VIPER_Project
//
//  Created by Denis Golovizin on 05.08.2021.
//

import Foundation
import UIKit

final class MainCoordinator {
    private var navigationController: UINavigationController

    init(navigationController: UINavigationController) {
        self.navigationController = navigationController
    }
}

// MARK: - CoordinatorProtocol
extension MainCoordinator: CoordinatorProtocol {
    func start() {
        let mainScreenViewController = MainScreenWireFrame().buildModule()
        navigationController.pushViewController(mainScreenViewController, animated: true)
    }
}

// MARK: - showDetailView method
extension MainCoordinator {
    func showDetailView(with image: UIImage) {
        let detailViewController = DetailViewWireFrame().buildDetailViewModule(image: image)
        navigationController.pushViewController(detailViewController, animated: true)
    }
}
