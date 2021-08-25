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
    private var readyToSave = false

    private var imageFrom: UIImage?
    private var view: ImageDownloaderView?

    private var interactor: ImageDownloaderInteractorProtocol
    private var router: ImageDownloaderRouterProtocol

    init(interactor: ImageDownloaderInteractorProtocol, router: ImageDownloaderRouterProtocol, imageFrom: UIImage?) {
        self.interactor = interactor
        self.router = router
        self.imageFrom = imageFrom
    }
}

// MARK: - ImageDownloaderPresenterProtocol
extension ImageDownloaderPresenter: ImageDownloaderPresenterProtocol {
    func viewDidLoad(view: ImageDownloaderView) {
        self.view = view

        if let image = imageFrom {
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

        view.configureTitleTextFieldAction { [weak self] _ in
            self?.view?.endEditing(true)
        }
    }

    func acceptDownload() {
        guard let imageToSave = imageFrom,
              readyToSave else { return router.presentAlert(with: ApplicationError.noImageToSave)
        }
        guard let title = view?.getTitleFromTextField(),
              !title.isEmpty else { return router.presentAlert(with: ApplicationError.emptyTitle) }
        interactor.saveToRealmDB(title: title, image: imageToSave) { [weak self]  result in
            switch result {
            case .success():
                self?.router.presentMainScreen()
                self?.readyToSave = false
            case .failure(let error):
                self?.router.presentAlert(with: error)
            }
        }
    }

    func getUrlFrom(textfield urlString: String?) {
        guard let urlString = urlString,
              !urlString.isEmpty,
              let url = URL(string: urlString) else { return router.presentAlert(with: NetworkError.unsupportedURL)
        }
        interactor.loadImage(from: url) {[weak self] result in
            DispatchQueue.main.async {
                switch result {
                case .success(let image):
                    self?.view?.updateView(with: image)
                    self?.imageFrom = image
                    self?.readyToSave = true
                case .failure(let error):
                    self?.router.presentAlert(with: error)
                }
            }
        }
    }
}
