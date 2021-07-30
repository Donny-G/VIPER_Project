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

        let mainScreenViewController = MainScreenViewController()
        let presenter = MainScreenPresenter()
        let interactor = MainScreenInteractor()
        let router = MainScreenRouter()

        mainScreenViewController.setPresenter(presenter: presenter)
        presenter.setInteractor(interactor: interactor)
        presenter.setRouter(router: router)

        return mainScreenViewController
    }
}
