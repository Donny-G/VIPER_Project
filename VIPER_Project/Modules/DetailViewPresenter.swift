//
//  DetailViewPresenter.swift
//  VIPER_Project
//
//  Created by Denis Golovizin on 29.07.2021.
//

import Foundation
import UIKit

protocol DetailViewPresenterProtocol {
    func viewDidLoad(imageView: UIImageView)
}

final class DetailViewPresenter {
    private var interactor: DetailViewInteractorProtocol
    private var router: DetailViewRouterProtocol

    private var image: UIImage?

    init(interactor: DetailViewInteractorProtocol, router: DetailViewRouterProtocol, image: UIImage) {
        self.interactor = interactor
        self.router = router
        self.image = image
    }
}

// MARK: - DetailViewPresenterProtocol

extension DetailViewPresenter: DetailViewPresenterProtocol {
    func viewDidLoad(imageView: UIImageView) {
        imageView.image = image
    }
}
