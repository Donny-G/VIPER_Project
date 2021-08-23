//
//  ImageDownloaderRouter.swift
//  VIPER_Project
//
//  Created by Denis Golovizin on 12.08.2021.
//

import Foundation

protocol ImageDownloaderRouterProtocol: AnyObject {
    func presentAlert(with error: ImageLoaderError)
}

final class ImageDownloaderRouter {
    var showAlert: ((ImageLoaderError) -> Void)

    init(showAlert: @escaping ((ImageLoaderError) -> Void)) {
        self.showAlert = showAlert
    }
}

// MARK: - ImageDownloaderRouterProtocol
extension ImageDownloaderRouter: ImageDownloaderRouterProtocol {
    func presentAlert(with error: ImageLoaderError) {
        showAlert(error)
    }
}
