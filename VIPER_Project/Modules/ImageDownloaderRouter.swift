//
//  ImageDownloaderRouter.swift
//  VIPER_Project
//
//  Created by Denis Golovizin on 12.08.2021.
//

import Foundation

protocol ImageDownloaderRouterProtocol: AnyObject {
    func presentAlert(error: ImageLoaderError)
}

final class ImageDownloaderRouter {
    var showAlert: ((ImageLoaderError) -> Void)

    init(showAlert: @escaping ((ImageLoaderError) -> Void)) {
        self.showAlert = showAlert
    }
}

extension ImageDownloaderRouter: ImageDownloaderRouterProtocol {
    func presentAlert(error: ImageLoaderError) {
        showAlert(error)
    }
}
