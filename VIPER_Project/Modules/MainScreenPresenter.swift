//
//  MainScreenPresenter.swift
//  VIPER_Project
//
//  Created by Denis Golovizin on 23.07.2021.
//

import Foundation

 protocol MainScreenPresenterProtocol: AnyObject {
    func viewDidLoad()
    func sendRequestForDataToInteractor()
    func didRetrieveData(objects: [PictureObject])
}

final class MainScreenPresenter {
    private var test = [String]()
    private var interactor: MainScreenInteractorProtocol?
    private var router: MainScreenRouterProtocol?
    private weak var view: MainScreenViewProtocol?
}

// MARK: - MainScreenPresenterProtocol
extension MainScreenPresenter: MainScreenPresenterProtocol {
    func sendRequestForDataToInteractor() {
        interactor?.retrieveData()
    }

    func didRetrieveData(objects: [PictureObject]) {
      //  view?.uploadDataFromPresenter(objects: objects)
        self.test = objects.compactMap {$0.title}
        print("pres \(test.count)")
    }

    func viewDidLoad() {

    }
}
