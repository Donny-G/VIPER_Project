//
//  DetailView.swift
//  VIPER_Project
//
//  Created by Denis Golovizin on 10.08.2021.
//

import UIKit

protocol GestureRecognizingProtocol: AnyObject {
    func pinchGestureRecognizerInit()
    func panGestureRecognizerInit()
}

final class DetailView: UIImageView {

    private var initialCenter = CGPoint()

    override init(frame: CGRect) {
        super.init(frame: frame)

        isUserInteractionEnabled = true
        pinchGestureRecognizerInit()
        panGestureRecognizerInit()
    }

    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}

// MARK: - GestureRecognizingProtocol
extension DetailView: GestureRecognizingProtocol {
    func pinchGestureRecognizerInit() {
        let pinchGestureRecognizer = UIPinchGestureRecognizer(target: self, action: #selector(didScaleImageView(_:)))
      self.addGestureRecognizer(pinchGestureRecognizer)
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
      self.addGestureRecognizer(panGestureRecognizer)
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
