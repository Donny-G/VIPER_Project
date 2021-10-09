//
//  MainScreenWireframe.swift
//  VIPER_Project
//
//  Created by Denis Golovizin on 26.07.2021.
//

import Foundation
import UIKit

struct MainScreenWireFrameParameters {
    var showImage: ((UIImage) -> Void)
    var showImageDownloaderView: (() -> Void)
    var showAlert: ((Error) -> Void)
}

protocol MainScreenWireFrameProtocol: AnyObject {
    func buildModule(params: MainScreenWireFrameParameters) -> UIViewController
}

final class MainScreenWireFrame {
    struct Dependency {
        let repository: RealmDBRepositoryProtocol
    }

    let dependency: Dependency

    init(dependency: Dependency) {
        self.dependency = dependency
    }
}

// MARK: - MainScreenWireFrameProtocol
extension MainScreenWireFrame: MainScreenWireFrameProtocol {
    func buildModule(params: MainScreenWireFrameParameters) -> UIViewController {
        let interactor = MainScreenInteractor(repository: dependency.repository)
        let router = MainScreenRouter(
            showImage: params.showImage,
            showImageDownloaderView: params.showImageDownloaderView, showAlert: params.showAlert
        )
        let presenter = MainScreenPresenter(interactor: interactor, router: router)

        let mainScreenViewController = MainScreenViewController()
        mainScreenViewController.presenter = presenter

        return mainScreenViewController
    }
}
