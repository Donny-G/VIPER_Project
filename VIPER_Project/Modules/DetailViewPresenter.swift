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
    private var image: UIImage?

    init(image: UIImage) {
        self.image = image
    }
}

// MARK: - DetailViewPresenterProtocol

extension DetailViewPresenter: DetailViewPresenterProtocol {
    func viewDidLoad(imageView: UIImageView) {
        imageView.image = image
    }
}
