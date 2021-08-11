//
//  DetailViewViewController.swift
//  VIPER_Project
//
//  Created by Denis Golovizin on 29.07.2021.
//

import UIKit

final class DetailViewController: UIViewController {
    private var imageView = DetailView(frame: .zero)

    var presenter: DetailViewPresenterProtocol?

    override func loadView() {
        super.loadView()
        self.view = imageView
    }

    override func viewDidLoad() {
        super.viewDidLoad()
        presenter?.viewDidLoad(imageView: imageView)
    }
}
