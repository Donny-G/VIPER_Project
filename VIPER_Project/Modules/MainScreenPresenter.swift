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
}

final class MainScreenPresenter {
    private var pictures: [String]?

    var interactor: MainScreenInteractorProtocol?
    var router: MainScreenRouterProtocol?
    weak var view: MainScreenViewProtocol?
}

// MARK: - MainScreenPresenterProtocol
extension MainScreenPresenter: MainScreenPresenterProtocol {

    func viewDidLoad() {
        print("main view is loaded and ready for data")
        let handler: ([PictureObject]) -> Void = {
            print("presenter receives data from interactor")
            self.pictures = $0.compactMap {$0.title}
            self.view?.feedbackFromPresenter()
        }
        interactor?.loadPicturesList(completion: handler)
    }

    func numberOfRowInSection() -> Int {
        guard let pictures = self.pictures else { return 0 }
        return pictures.count
    }

    func textLabel(indexPath: IndexPath) -> String? {
        guard let pictures = self.pictures else { return nil }
        return pictures[indexPath.row]
    }
}
