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
    func getUrlFrom(url: String?)
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

extension ImageDownloaderPresenter: ImageDownloaderPresenterProtocol {
    func viewDidLoad(view: ImageDownloaderView) {
        self.view = view

        view.previewImageView.image = image

        view.acceptButton.addAction(UIAction(handler: { _ in
            self.acceptDownload()
        }), for: .touchUpInside)

        view.urlTextField.addAction(UIAction(handler: { _ in
            self.getUrlFrom(url: view.urlTextField.text)
        }), for: .editingDidEndOnExit)

        view.enterUrlButton.addAction(UIAction(handler: { _ in
            self.getUrlFrom(url: view.urlTextField.text)
        }), for: .touchUpInside)
    }

    func acceptDownload() {
        print("saved")
    }

    func getUrlFrom(url: String?) {
        let completionHandler: (Result <UIImage, ImageLoaderError>) -> Void = { result in
            switch result {
            case .success(let image):
                DispatchQueue.main.async {
                    self.view?.previewImageView.image = image
                }
            case .failure(let error):
                DispatchQueue.main.async {
                    self.router.presentAlert(error: error)
                }
            }
        }
        interactor.loadImage(from: url, completion: completionHandler)
    }
}
