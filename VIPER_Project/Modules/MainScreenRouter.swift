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
    func presentImageDownloaderView()
    func presentAlert(with error: Error)
}

final class MainScreenRouter {
    var showImage: ((UIImage) -> Void)

    var showImageDownloaderView: (() -> Void)

    var showAlert: ((Error) -> Void)

    init(showImage: @escaping ((UIImage) -> Void),
         showImageDownloaderView: @escaping (() -> Void),
         showAlert: @escaping ((Error) -> Void)) {
        self.showImage = showImage
        self.showImageDownloaderView = showImageDownloaderView
        self.showAlert = showAlert
    }
}

// MARK: - MainScreenRouterProtocol
extension MainScreenRouter: MainScreenRouterProtocol {
    func presentDetailView(image: UIImage) {
        showImage(image)
    }

    func presentImageDownloaderView() {
        showImageDownloaderView()
    }

    func presentAlert(with error: Error) {
        showAlert(error)
    }
}
