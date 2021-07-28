//
//  MainScreenWireframe.swift
//  VIPER_Project
//
//  Created by Denis Golovizin on 26.07.2021.
//

import Foundation
import UIKit

protocol MainScreenWireFrameProtocol: AnyObject {
    func buildModule() -> UINavigationController
}

final class MainScreenWireFrame {

}

// MARK: - MainScreenWireFrameProtocol
extension MainScreenWireFrame: MainScreenWireFrameProtocol {
    func buildModule() -> UINavigationController {
        var storyboard: UIStoryboard {
            return UIStoryboard(name: "Main", bundle: Bundle.main)
        }

        let presenter: MainScreenPresenterProtocol = MainScreenPresenter()
        let interactor: MainScreenInteractorProtocol = MainScreenInteractor()
        let router: MainScreenRouterProtocol = MainScreenRouter()
      //  module.presenter = presenter
        // presenter.view = module
     //   presenter.interactor = interactor
      //  presenter.router = router
      //  interactor.presenter = presenter
        print("create main screen module")
       let mainScreenViewController = MainScreenViewController()
        let navigationController = UINavigationController(rootViewController: mainScreenViewController)
        return navigationController
    }
}
