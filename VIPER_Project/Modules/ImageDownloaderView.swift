//
//  ImageDownloaderView.swift
//  VIPER_Project
//
//  Created by Denis Golovizin on 12.08.2021.
//

import UIKit

final class ImageDownloaderView: UIView {
    private var urlTextField = UITextField()
    private var previewImageView = UIImageView()
    private var acceptButton = UIButton()
    private var enterUrlButton = UIButton()
    private var vstackView = UIStackView()
    private var textFieldAndButtonStackView = UIStackView()

    override init(frame: CGRect) {
        super.init(frame: frame)

        self.backgroundColor = .white

        textFieldAndButtonStackView.configureStackView(axis: .horizontal)
        vstackView.configureStackView(axis: .vertical)

        urlTextField = TextFieldFactory.buildURLTextField()
        enterUrlButton = ButtonFactory.buildEnterUrlButton()
        acceptButton = ButtonFactory.buildAcceptButton()
        previewImageView = ImageViewFactory.buildPreviewImageView()

        addSubviews()

        vstackView.pin(edges: [
                        .top, .bottom, .left(offset: 20), .right(offset: -20)
        ], target: self)
    }

    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }

    func updateView(with image: UIImage) {
        previewImageView.image = image
    }

    func configureAcceptButtonAction(handler: @escaping UIActionHandler) {
        acceptButton.addTapAction(handler: handler)
    }

    func configureURLTextFieldAction(handler: @escaping UIActionHandler) {
        urlTextField.addTapEnterAction(handler: handler)
    }

    func configureEnterURLButton(handler: @escaping UIActionHandler) {
        enterUrlButton.addTapAction(handler: handler)
    }

    func getURLFromTextField() -> String? {
        return urlTextField.text
    }
}
    // MARK: - Private
private extension ImageDownloaderView {
    func addSubviews() {
        textFieldAndButtonStackView.addViews(from: [urlTextField, enterUrlButton])
        vstackView.addViews(from: [textFieldAndButtonStackView, previewImageView, acceptButton])
        self.addSubview(vstackView)
    }
}
