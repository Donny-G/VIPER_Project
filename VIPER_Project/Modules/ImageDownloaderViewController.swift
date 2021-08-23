//
//  ImageDownloaderViewController.swift
//  VIPER_Project
//
//  Created by Denis Golovizin on 12.08.2021.
//

import UIKit

final class ImageDownloaderViewController: UIViewController {
    var presenter: ImageDownloaderPresenterProtocol?

    private var imageDownloaderView = ImageDownloaderView(frame: .zero)

    override func loadView() {
        super.loadView()
        view = imageDownloaderView
    }

    override func viewDidLoad() {
        super.viewDidLoad()
        presenter?.viewDidLoad(view: imageDownloaderView)
    }
}
