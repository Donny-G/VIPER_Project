//
//  DetailViewWireFrame.swift
//  VIPER_Project
//
//  Created by Denis Golovizin on 29.07.2021.
//

import Foundation
import UIKit

protocol DetailViewWireFrameProtocol: AnyObject {
    func buildDetailViewModule(image: UIImage) -> UIViewController
}

final class DetailViewWireFrame {

}

// MARK: - DetailViewWireFrameProtocol
extension DetailViewWireFrame: DetailViewWireFrameProtocol {
    func buildDetailViewModule(image: UIImage) -> UIViewController {
        let presenter = DetailViewPresenter(image: image)

        let detailViewController = DetailViewController()
        detailViewController.presenter = presenter

        return detailViewController
    }
}
