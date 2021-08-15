//
//  ImageDownloaderWireframe.swift
//  VIPER_Project
//
//  Created by Denis Golovizin on 12.08.2021.
//

import Foundation
import UIKit

protocol ImageDownloaderWireframeProtocol {
    func buildImageDownloaderModule() -> UIViewController
}

final class ImageDownloaderWireframe {
    struct Dependency {
        var showAlert: ((String) -> Void)
    }

    let dependency: Dependency

    init(dependency: Dependency) {
        self.dependency = dependency
    }

}

extension ImageDownloaderWireframe: ImageDownloaderWireframeProtocol {
    func buildImageDownloaderModule() -> UIViewController {
        let interactor = ImageDownloaderInteractor()
        let router = ImageDownloaderRouter(showAlert: dependency.showAlert)
        let presenter = ImageDownloaderPresenter(
            interactor: interactor, router: router, image: UIImage(systemName: InterfaceIconsEnum.defaultImage.rawValue)
        )

        let imageDownloaderViewController = ImageDownloaderViewController()
        imageDownloaderViewController.presenter = presenter

        return imageDownloaderViewController
    }
}
