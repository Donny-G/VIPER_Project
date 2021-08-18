//
//  ImageDownloaderView.swift
//  VIPER_Project
//
//  Created by Denis Golovizin on 12.08.2021.
//

import UIKit

final class ImageDownloaderView: UIView {
    var urlTextField = UITextField()
    var previewImageView = UIImageView()
    var acceptButton = UIButton()
    var enterUrlButton = UIButton()
    var vstackView = UIStackView()
    var hstackView = UIStackView()

    override init(frame: CGRect) {
        super.init(frame: frame)

        self.backgroundColor = .white

        hstackView.config(axis: .horizontal)
        vstackView.config(axis: .vertical)

        textFieldConfig()
        buttonsConfig()
        previewImageConfig()

        addSubviews()
        autolayouStackView()
    }

    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}

private extension ImageDownloaderView {
    // MARK: - addSubviews
    func addSubviews() {
        hstackView.addArrangedSubview(urlTextField)
        hstackView.addArrangedSubview(enterUrlButton)
        vstackView.addArrangedSubview(hstackView)
        vstackView.addArrangedSubview(previewImageView)
        vstackView.addArrangedSubview(acceptButton)
        self.addSubview(vstackView)
    }

    func autolayouStackView() {
        // MARK: - stackView layout config
        NSLayoutConstraint.activate([
            vstackView.topAnchor.constraint(equalTo: safeAreaLayoutGuide.topAnchor),
            vstackView.leadingAnchor.constraint(equalTo: safeAreaLayoutGuide.leadingAnchor, constant: 20),
            vstackView.trailingAnchor.constraint(equalTo: safeAreaLayoutGuide.trailingAnchor, constant: -20),
            vstackView.bottomAnchor.constraint(equalTo: safeAreaLayoutGuide.bottomAnchor)
        ])
    }

    func buttonsConfig() {
        // MARK: - enterUrlButton appearance config
        enterUrlButton = ButtonFactory.buildButton(config: ButtonFactory.ButtonStyle(
                                                    height: 50,
                                                    color: UIColor.firstButton,
                                                    image: InterfaceIconsEnum.enterUrlButton.image!,
                                                    title: nil))
        // MARK: - acceptButton appearance config
        acceptButton = ButtonFactory.buildButton(config: ButtonFactory.ButtonStyle(
                                                    height: 100,
                                                    color: UIColor.secondButton,
                                                    image: InterfaceIconsEnum.acceptButton.image!,
                                                    title: ImageDownloaderEnum.acceptButton.rawValue))
    }
    // MARK: - urlTextField appearance config
    func textFieldConfig() {
        urlTextField.placeholder = ImageDownloaderEnum.urlTextFieldPlaceholder.rawValue
        urlTextField.font = UIFont.systemFont(ofSize: 20, weight: UIFont.Weight(5))
        urlTextField.textAlignment = .center
        urlTextField.backgroundColor = .gray.withAlphaComponent(0.5)
        urlTextField.defaultLayerConfig(borderWidth: 2, cornerRadius: 20)
    }
    // MARK: - preview appearance config
    func previewImageConfig() {
        previewImageView.backgroundColor = UIColor.preview
        previewImageView.defaultLayerConfig(borderWidth: 2, cornerRadius: 20)
    }
}
