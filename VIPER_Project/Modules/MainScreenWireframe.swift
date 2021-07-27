//
//  MainScreenWireframe.swift
//  VIPER_Project
//
//  Created by Denis Golovizin on 26.07.2021.
//

import Foundation

protocol MainScreenWireFrameProtocol: AnyObject {
    func buildModule(module: MainScreenViewController)
}

class MainScreenWireFrame: MainScreenWireFrameProtocol {
    func buildModule(module: MainScreenViewController) {
        let presenter: MainScreenPresenterProtocol = MainScreenPresenter()
        let interactor: MainScreenInteractorProtocol = MainScreenInteractor()
        let router: MainScreenRouterProtocol = MainScreenRouter()
        module.presenter = presenter
        presenter.view = module
        presenter.interactor = interactor
        presenter.router = router
        interactor.presenter = presenter
    }
}
