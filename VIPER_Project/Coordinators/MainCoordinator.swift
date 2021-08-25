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

        let showAlert: (Error) -> Void = { [weak self] in
            self?.showAlert(with: $0)
        }

        let dependency = MainScreenWireFrame.Dependency(
            showImage: showImage,
            showImageDownloaderView: showImageDownloaderView, showAlert: showAlert
        )

        let mainScreenViewController = MainScreenWireFrame(dependency: dependency).buildModule()
        navigationController.pushViewController(mainScreenViewController, animated: true)
    }
}

// MARK: - Private
private extension MainCoordinator {
    func showDetailView(with image: UIImage) {
        let detailViewController = DetailViewWireFrame().buildDetailViewModule(image: image)
        navigationController.pushViewController(detailViewController, animated: true)
    }

    func showImageDownloaderView() {
        let showAlert: (Error) -> Void = { [weak self] in
            self?.showAlert(with: $0)
        }

        let showMainScreen: () -> Void = { [weak self] in
            self?.navigationController.popViewController(animated: true)
        }

        let dependency = ImageDownloaderWireframe.Dependency(showAlert: showAlert, showMainScreen: showMainScreen)

        let imageDownloaderController = ImageDownloaderWireframe(dependency: dependency ).buildImageDownloaderModule()
        navigationController.pushViewController(imageDownloaderController, animated: true)
    }

    func showAlert(with error: Error) {
        let alert = UIAlertController(
            title: NSLocalizedString("alertTitle", comment: "Title for alert"),
            message: error.localizedDescription,
            preferredStyle: .alert
        )

        alert.addAction(
            UIAlertAction(title: NSLocalizedString("alertOkButtonTitle", comment: "Ok"),
                          style: .cancel,
                          handler: nil)
        )

        navigationController.present(alert, animated: true, completion: nil)
    }
}
