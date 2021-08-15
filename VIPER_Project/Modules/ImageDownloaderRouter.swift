//
//  ImageDownloaderRouter.swift
//  VIPER_Project
//
//  Created by Denis Golovizin on 12.08.2021.
//

import Foundation

protocol ImageDownloaderRouterProtocol {
    func presentAlert(error: String)
}

final class ImageDownloaderRouter {
    var showAlert: ((String) -> Void)

    init(showAlert: @escaping ((String) -> Void)) {
        self.showAlert = showAlert
    }
}

extension ImageDownloaderRouter: ImageDownloaderRouterProtocol {
    func presentAlert(error: String) {
        showAlert(error)
    }
}
