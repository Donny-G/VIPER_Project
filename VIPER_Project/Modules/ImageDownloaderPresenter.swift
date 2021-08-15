//
//  ImageDownloaderPresenter.swift
//  VIPER_Project
//
//  Created by Denis Golovizin on 12.08.2021.
//

import Foundation
import UIKit

protocol ImageDownloaderPresenterProtocol {
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
    }

    func acceptDownload() {
        print("saved")
    }

    func getUrlFrom(url: String?) {
        let imageHandler: (UIImage) -> Void = { image in
            DispatchQueue.main.async {
                self.view?.previewImageView.image = image
            }
        }

        let errorHandler: (String) -> Void = { error in
            DispatchQueue.main.async {
                self.router.presentAlert(error: error)
            }
        }

        interactor.loadImage(from: url, imageCompletion: imageHandler, errorCompletion: errorHandler)
    }
}
