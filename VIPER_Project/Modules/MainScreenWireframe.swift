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

}

// MARK: - MainScreenWireFrameProtocol
extension MainScreenWireFrame: MainScreenWireFrameProtocol {
    func buildModule() -> UIViewController {
        print("build up main screen module")

        let mainScreenViewController = MainScreenViewController()
        let presenter = MainScreenPresenter()
        let interactor = MainScreenInteractor()
        let router = MainScreenRouter()

        mainScreenViewController.presenter = presenter
        presenter.view = mainScreenViewController
        presenter.interactor = interactor
        presenter.router = router
        interactor.presenter = presenter

        return mainScreenViewController
    }
}
