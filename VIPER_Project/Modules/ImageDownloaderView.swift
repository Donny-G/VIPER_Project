//
//  ImageDownloaderView.swift
//  VIPER_Project
//
//  Created by Denis Golovizin on 12.08.2021.
//

import UIKit

final class ImageDownloaderView: UIView {
    var urlTextField: UITextField
    var previewImageView: UIImageView
    var acceptButton: UIButton
    var enterUrlButton: UIButton

    override init(frame: CGRect) {
        urlTextField = UITextField()
        previewImageView = UIImageView()
        acceptButton = UIButton()
        enterUrlButton = UIButton()

        super.init(frame: frame)

        subviewsConfig()
        autolayoutConfig()
    }

    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}

extension ImageDownloaderView {
    func subviewsConfig() {
        self.backgroundColor = .white

        // MARK: - urlTextField appearance config
        urlTextField.placeholder = ImageDownloaderEnum.urlTextFieldPlaceholder.rawValue
        urlTextField.font = UIFont.systemFont(ofSize: 20, weight: UIFont.Weight(5))
        urlTextField.textAlignment = .center

        urlTextField.layer.cornerRadius = 20
        urlTextField.layer.borderWidth = 2
        urlTextField.layer.borderColor = UIColor.black.cgColor
        urlTextField.backgroundColor = .gray.withAlphaComponent(0.5)

        self.addSubview(urlTextField)

        // MARK: - enterUrlButton appearance config
        enterUrlButton.backgroundColor = .orange.withAlphaComponent(0.5)
        enterUrlButton.setImage(UIImage(systemName: InterfaceIconsEnum.enterUrlButton.rawValue), for: .normal)

        enterUrlButton.layer.borderWidth = 2
        enterUrlButton.layer.borderColor = UIColor.black.cgColor
        enterUrlButton.layer.cornerRadius = 10
        enterUrlButton.clipsToBounds = true

        self.addSubview(enterUrlButton)

        // MARK: - previewImageView appearance config
        previewImageView.backgroundColor = .yellow

        previewImageView.layer.masksToBounds = true
        previewImageView.layer.cornerRadius = 20
        previewImageView.layer.borderWidth = 5
        previewImageView.layer.borderColor = UIColor.black.cgColor

        self.addSubview(previewImageView)

        // MARK: - acceptButton appearance config
        acceptButton.backgroundColor = .yellow.withAlphaComponent(0.5)
        acceptButton.setImage(UIImage(systemName: InterfaceIconsEnum.acceptButton.rawValue), for: .normal)

        acceptButton.setTitle(ImageDownloaderEnum.acceptButton.rawValue, for: .normal)
        acceptButton.setTitleColor(UIColor.black, for: .normal)
        acceptButton.titleLabel?.font = UIFont.systemFont(ofSize: 20, weight: UIFont.Weight(2))

        acceptButton.layer.borderWidth = 2
        acceptButton.layer.borderColor = UIColor.black.cgColor
        acceptButton.layer.cornerRadius = 50
        acceptButton.clipsToBounds = true

        self.addSubview(acceptButton)
}

    func autolayoutConfig() {
        // MARK: - urlTextField autolayout config
        urlTextField.translatesAutoresizingMaskIntoConstraints = false
        NSLayoutConstraint.activate([
            urlTextField.heightAnchor.constraint(lessThanOrEqualToConstant: 50),
            urlTextField.topAnchor.constraint(equalTo: safeAreaLayoutGuide.topAnchor, constant: 10),
            urlTextField.leadingAnchor.constraint(equalTo: safeAreaLayoutGuide.leadingAnchor, constant: 20)
        ])

        // MARK: - enterUrlButton autolayout config
        enterUrlButton.translatesAutoresizingMaskIntoConstraints = false
        NSLayoutConstraint.activate([
            enterUrlButton.centerYAnchor.constraint(equalTo: urlTextField.centerYAnchor),
            enterUrlButton.topAnchor.constraint(equalTo: safeAreaLayoutGuide.topAnchor, constant: 10),
            enterUrlButton.leadingAnchor.constraint(equalTo: urlTextField.trailingAnchor, constant: 5),
            enterUrlButton.trailingAnchor.constraint(equalTo: safeAreaLayoutGuide.trailingAnchor, constant: -20),
            enterUrlButton.heightAnchor.constraint(equalToConstant: 50),
            enterUrlButton.widthAnchor.constraint(equalToConstant: 50)
        ])

        // MARK: - previewImageView autolayout config
        previewImageView.translatesAutoresizingMaskIntoConstraints = false
        NSLayoutConstraint.activate([
            previewImageView.centerXAnchor.constraint(equalTo: self.centerXAnchor),
            previewImageView.topAnchor.constraint(lessThanOrEqualTo: urlTextField.bottomAnchor, constant: 20),
            previewImageView.leadingAnchor.constraint(equalTo: safeAreaLayoutGuide.leadingAnchor, constant: 20),
            previewImageView.trailingAnchor.constraint(equalTo: safeAreaLayoutGuide.trailingAnchor, constant: -20),
            previewImageView.heightAnchor.constraint(equalTo: safeAreaLayoutGuide.heightAnchor, multiplier: 0.7)
        ])

        // MARK: - acceptButton autolayout config
        acceptButton.translatesAutoresizingMaskIntoConstraints = false
        NSLayoutConstraint.activate([
            acceptButton.centerXAnchor.constraint(equalTo: self.centerXAnchor),
            acceptButton.topAnchor.constraint(equalTo: previewImageView.bottomAnchor, constant: 20),
            acceptButton.heightAnchor.constraint(equalToConstant: 100),
            acceptButton.widthAnchor.constraint(equalToConstant: 100),
            acceptButton.bottomAnchor.constraint(lessThanOrEqualTo: safeAreaLayoutGuide.bottomAnchor, constant: 10)
        ])
    }
}
