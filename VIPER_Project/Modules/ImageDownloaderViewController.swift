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
        setupActions()
    }
}

extension ImageDownloaderViewController {
    func setupActions() {
        imageDownloaderView.acceptButton.addTarget(self, action: #selector(acceptButtonAction), for: .touchUpInside)

        imageDownloaderView.urlTextField.addTarget(
            self, action: #selector(urlTextFieldAction),
            for: .editingDidEndOnExit
        )

        imageDownloaderView.enterUrlButton.addTarget(
            self,
            action: #selector(urlTextFieldAction),
            for: .touchUpInside
        )
    }

    @objc func acceptButtonAction() {
        presenter?.acceptDownload()
    }

    @objc func urlTextFieldAction() {
        presenter?.getUrlFrom(url: imageDownloaderView.urlTextField.text)
    }
}
