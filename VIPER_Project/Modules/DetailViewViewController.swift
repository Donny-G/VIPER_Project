//
//  DetailViewViewController.swift
//  VIPER_Project
//
//  Created by Denis Golovizin on 29.07.2021.
//

import UIKit

final class DetailViewViewController: UIViewController {

    private var imageView = UIImageView()

    override func viewDidLoad() {
        super.viewDidLoad()
        initialImageConfig()
    }

    func initialImageConfig() {
        imageView.image = UIImage(systemName: "pencil")
        imageView.translatesAutoresizingMaskIntoConstraints = false
        view.addSubview(imageView)
        NSLayoutConstraint.activate([ imageView.widthAnchor.constraint(equalTo: view.widthAnchor, multiplier: 0.7),
            imageView.heightAnchor.constraint(equalTo: view.heightAnchor, multiplier: 0.8),
            imageView.centerXAnchor.constraint(equalTo: view.centerXAnchor),
            imageView.centerYAnchor.constraint(equalTo: view.centerYAnchor)
        ])
    }
}
