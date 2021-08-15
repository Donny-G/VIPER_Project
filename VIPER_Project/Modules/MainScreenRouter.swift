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
}

final class MainScreenRouter {
    var showImage: ((UIImage) -> Void)

    var showImageDownloaderView: (() -> Void)

    init(showImage: @escaping ((UIImage) -> Void), showImageDownloaderView: @escaping (() -> Void)) {
        self.showImage = showImage
        self.showImageDownloaderView = showImageDownloaderView
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
}
