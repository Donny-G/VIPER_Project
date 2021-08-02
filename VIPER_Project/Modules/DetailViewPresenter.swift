//
//  DetailViewPresenter.swift
//  VIPER_Project
//
//  Created by Denis Golovizin on 29.07.2021.
//

import Foundation
import UIKit

protocol DetailViewPresenterProtocol {
    func viewDidLoad(imageView: inout UIImageView, viewController: UIViewController)
}

final class DetailViewPresenter {

}

// MARK: - DetailViewPresenterProtocol

extension DetailViewPresenter: DetailViewPresenterProtocol {
    func viewDidLoad(imageView: inout UIImageView, viewController: UIViewController) {
        imageView.image = UIImage(systemName: "pencil")
        imageView.translatesAutoresizingMaskIntoConstraints = false
        viewController.view.addSubview(imageView)

        NSLayoutConstraint.activate([
            imageView.widthAnchor.constraint(equalTo: viewController.view.widthAnchor, multiplier: 0.7),
            imageView.heightAnchor.constraint(equalTo: viewController.view.heightAnchor, multiplier: 0.8),
            imageView.centerXAnchor.constraint(equalTo: viewController.view.centerXAnchor),
            imageView.centerYAnchor.constraint(equalTo: viewController.view.centerYAnchor)
        ])

        imageView.isUserInteractionEnabled = true
    }
}
