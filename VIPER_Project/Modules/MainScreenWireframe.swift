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

        // MARK: - not so clean solution

        let mainScreenViewController = MainScreenViewController()

        let interactor = MainScreenInteractor()
        let router = MainScreenRouter(mainScreenViewController: mainScreenViewController)
        let presenter = MainScreenPresenter(interactor: interactor, router: router)

        mainScreenViewController.presenter = presenter

        return mainScreenViewController
    }
}
