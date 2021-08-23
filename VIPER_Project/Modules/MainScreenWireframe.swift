//
//  MainScreenWireframe.swift
//  VIPER_Project
//
//  Created by Denis Golovizin on 26.07.2021.
//

import Foundation
import UIKit

protocol MainScreenWireFrameProtocol: AnyObject {
    func buildModule() -> UIViewController
}

final class MainScreenWireFrame {
    struct Dependency {
        var showImage: ((UIImage) -> Void)
        var showImageDownloaderView: (() -> Void)
    }

    let dependency: Dependency

    init(dependency: Dependency) {
        self.dependency = dependency
    }
}

// MARK: - MainScreenWireFrameProtocol
extension MainScreenWireFrame: MainScreenWireFrameProtocol {
    func buildModule() -> UIViewController {
        let interactor = MainScreenInteractor()
        let router = MainScreenRouter(
            showImage: self.dependency.showImage,
            showImageDownloaderView: self.dependency.showImageDownloaderView
        )
        let presenter = MainScreenPresenter(interactor: interactor, router: router)

        let mainScreenViewController = MainScreenViewController()
        mainScreenViewController.presenter = presenter

        return mainScreenViewController
    }
}
