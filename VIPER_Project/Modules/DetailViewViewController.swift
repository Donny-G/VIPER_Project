//
//  DetailViewViewController.swift
//  VIPER_Project
//
//  Created by Denis Golovizin on 29.07.2021.
//

import UIKit

protocol GestureRecognizingProtocol {
    func pinchGestureRecognizerInit()
    func panGestureRecognizerInit()
}

final class DetailViewController: UIViewController {

    private var imageView = UIImageView()
    private var initialCenter = CGPoint()

    var presenter: DetailViewPresenterProtocol?

    override func loadView() {
        super.loadView()
        self.view = imageView
    }

    override func viewDidLoad() {
        super.viewDidLoad()

        presenter?.viewDidLoad(imageView: imageView)

        imageView.isUserInteractionEnabled = true
        pinchGestureRecognizerInit()
        panGestureRecognizerInit()
    }
}

// MARK: - GestureRecognizingProtocol

extension DetailViewController: GestureRecognizingProtocol {
    func pinchGestureRecognizerInit() {
        let pinchGestureRecognizer = UIPinchGestureRecognizer(target: self, action: #selector(didScaleImageView(_:)))
        imageView.addGestureRecognizer(pinchGestureRecognizer)
    }

    @objc private func didScaleImageView(_ sender: UIPinchGestureRecognizer) {
        guard sender.view != nil else { return }
        if sender.state == .began || sender.state == .changed {
            sender.view?.transform = sender.view?.transform.scaledBy(x: sender.scale, y: sender.scale) ?? .identity
            sender.scale = 1.0
        }
    }

    func panGestureRecognizerInit() {
        let panGestureRecognizer = UIPanGestureRecognizer(target: self, action: #selector(didPanImageView(_:)))
        imageView.addGestureRecognizer(panGestureRecognizer)
    }

    @objc private func didPanImageView(_ sender: UIPanGestureRecognizer) {
        guard sender.view != nil else { return }
        let piece = sender.view
        let translation = sender.translation(in: piece?.superview)
        if sender.state == .began {
            self.initialCenter = piece?.center ?? CGPoint(x: 0, y: 0)
        }
        if sender.state != .cancelled {
            let newCenter = CGPoint(x: initialCenter.x + translation.x, y: initialCenter.y + translation.y)
            piece?.center = newCenter
        } else {
            piece?.center = initialCenter
        }
    }
}
