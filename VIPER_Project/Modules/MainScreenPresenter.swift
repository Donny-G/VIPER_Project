//
//  MainScreenPresenter.swift
//  VIPER_Project
//
//  Created by Denis Golovizin on 23.07.2021.
//

import Foundation

 protocol MainScreenPresenterProtocol: AnyObject {
    func viewDidLoad()

    func numberOfRowInSection() -> Int
    func textLabel(indexPath: IndexPath) -> String?

    // test version of func
    func feedbackFromInteractor(pictures: [PictureObject])
}

final class MainScreenPresenter {
    private var test = ["one", "two", "three"]
    private var pictures: [String]?

    var interactor: MainScreenInteractorProtocol?
    var router: MainScreenRouterProtocol?
    weak var view: MainScreenViewProtocol?
}

// MARK: - MainScreenPresenterProtocol
extension MainScreenPresenter: MainScreenPresenterProtocol {
    func viewDidLoad() {
        print("main view is loaded and ready for data")
        interactor?.loadPicturesList()
    }

    func numberOfRowInSection() -> Int {
        guard let pictures = self.pictures else { return 0 }
        // return test.count
        return pictures.count
    }

    func textLabel(indexPath: IndexPath) -> String? {
        guard let pictures = self.pictures else { return nil }
        return pictures[indexPath.row]
        // return test[indexPath.row]
    }

    // test version of func
    func feedbackFromInteractor(pictures: [PictureObject]) {
        print("presenter receives data from interactor")
        self.pictures = pictures.compactMap {$0.title}
        print(pictures.count)
        view?.feedbackFromPresenter()
    }
}
