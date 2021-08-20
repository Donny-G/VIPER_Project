//
//  ImageDownloaderPresenter.swift
//  VIPER_Project
//
//  Created by Denis Golovizin on 12.08.2021.
//

import Foundation
import UIKit

protocol ImageDownloaderPresenterProtocol: AnyObject {
    func viewDidLoad(view: ImageDownloaderView)
    func acceptDownload()
    func getUrlFrom(textfield urlString: String?)
}

final class ImageDownloaderPresenter {
    private var image: UIImage?
    private var view: ImageDownloaderView?

    private var interactor: ImageDownloaderInteractorProtocol
    private var router: ImageDownloaderRouterProtocol

    init(interactor: ImageDownloaderInteractorProtocol, router: ImageDownloaderRouterProtocol, image: UIImage?) {
        self.interactor = interactor
        self.router = router
        self.image = image
    }
}

// MARK: - ImageDownloaderPresenterProtocol
extension ImageDownloaderPresenter: ImageDownloaderPresenterProtocol {
    func viewDidLoad(view: ImageDownloaderView) {
        self.view = view

        if let image = image {
            view.updateView(with: image)
        }

        view.configureAcceptButtonAction {[weak self] _ in
            self?.acceptDownload()
        }

        view.configureURLTextFieldAction {[weak self] _ in
            self?.getUrlFrom(textfield: view.getURLFromTextField())
        }

        view.configureEnterURLButton {[weak self] _ in
            self?.getUrlFrom(textfield: view.getURLFromTextField())
        }
    }

    func acceptDownload() {
        print("saved")
    }

    func getUrlFrom(textfield urlString: String?) {
        guard let urlString = urlString, !urlString.isEmpty, let url = URL(string: urlString) else {
            return router.presentAlert(with: .unsupportedURL)
        }
        interactor.loadImage(from: url) {[weak self] result in
            DispatchQueue.main.async {
                switch result {
                case .success(let image):
                        self?.view?.updateView(with: image)
                case .failure(let error):
                        self?.router.presentAlert(with: error)
                }
            }
        }
    }
}
