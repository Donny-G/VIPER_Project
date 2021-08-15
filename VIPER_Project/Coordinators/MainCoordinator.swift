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
        let showImage: (UIImage) -> Void = { [weak self] in
            self?.showDetailView(with: $0)
        }

        let showImageDownloaderView: () -> Void = { [weak self] in
            self?.showImageDownloaderView()
        }

        let dependency = MainScreenWireFrame.Dependency(
            showImage: showImage,
            showImageDownloaderView: showImageDownloaderView
        )

        let mainScreenViewController = MainScreenWireFrame(dependency: dependency).buildModule()
        navigationController.pushViewController(mainScreenViewController, animated: true)
    }
}

// MARK: - showDetailView method
private extension MainCoordinator {
    func showDetailView(with image: UIImage) {
        let detailViewController = DetailViewWireFrame().buildDetailViewModule(image: image)
        navigationController.pushViewController(detailViewController, animated: true)
    }
}

// MARK: - showImageDownloaderView method
private extension MainCoordinator {
    func showImageDownloaderView() {
        let showAlert: (String) -> Void = { [weak self] in
            self?.showAlert(with: $0)
        }

        let dependency = ImageDownloaderWireframe.Dependency(showAlert: showAlert)

        let imageDownloaderController = ImageDownloaderWireframe(dependency: dependency ).buildImageDownloaderModule()
        navigationController.pushViewController(imageDownloaderController, animated: true)
    }
}

// MARK: - showAlert method
private extension MainCoordinator {
    func showAlert(with error: String) {
        let alert = UIAlertController(
            title: ImageDownloaderEnum.alertTitle.rawValue,
            message: error,
            preferredStyle: .alert
        )

        alert.addAction(
            UIAlertAction(title: ImageDownloaderEnum.alertOkButtonTitle.rawValue,
                          style: .cancel,
                          handler: nil)
        )

        navigationController.present(alert, animated: true, completion: nil)
    }
}
