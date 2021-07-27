//
//  MainScreenPresenter.swift
//  VIPER_Project
//
//  Created by Denis Golovizin on 23.07.2021.
//

import Foundation

 protocol MainScreenPresenterProtocol: AnyObject {
    var interactor: MainScreenInteractorProtocol? { get set }
    var router: MainScreenRouterProtocol? { get set }
    var view: MainScreenViewProtocol? { get set }
    func sendRequestForDataToInteractor()
    func didRetrieveData(objects: [Object])
}

class MainScreenPresenter: MainScreenPresenterProtocol {
    var test = [String]()
    var interactor: MainScreenInteractorProtocol?
    var router: MainScreenRouterProtocol?
    weak var view: MainScreenViewProtocol?
    func sendRequestForDataToInteractor() {
        interactor?.retrieveData()
    }
    func didRetrieveData(objects: [Object]) {
        view?.uploadDataFromPresenter(objects: objects)
        self.test = objects.compactMap {$0.title}
        print("pres \(test.count)")
    }
}
