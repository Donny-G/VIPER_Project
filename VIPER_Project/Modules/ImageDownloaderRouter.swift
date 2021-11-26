//
//  ImageDownloaderRouter.swift
//  VIPER_Project
//
//  Created by Denis Golovizin on 12.08.2021.
//

import Foundation

protocol ImageDownloaderRouterProtocol: AnyObject {
    func presentAlert(with error: Error)
    func presentMainScreen()
}

final class ImageDownloaderRouter {
    var showAlert: ((Error) -> Void)
    var showMainScreen: (() -> Void)

    init(showAlert: @escaping ((Error) -> Void), showMainScreen: @escaping (() -> Void)) {
        self.showAlert = showAlert
        self.showMainScreen = showMainScreen
    }
}

// MARK: - ImageDownloaderRouterProtocol
extension ImageDownloaderRouter: ImageDownloaderRouterProtocol {
    func presentAlert(with error: Error) {
        showAlert(error)
    }

    func presentMainScreen() {
        showMainScreen()
    }
}
