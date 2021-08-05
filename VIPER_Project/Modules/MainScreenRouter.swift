//
//  MainScreenRouter.swift
//  VIPER_Project
//
//  Created by Denis Golovizin on 23.07.2021.
//

import Foundation
import UIKit

protocol MainScreenRouterProtocol: AnyObject {

    func presentDetailView(image: UIImage)
}

final class MainScreenRouter {

    // MARK: - not so clean solution

    private var mainScreenViewController: MainScreenViewController
    init (mainScreenViewController: MainScreenViewController) {
        self.mainScreenViewController = mainScreenViewController
    }
}

// MARK: - MainScreenRouterProtocol
extension MainScreenRouter: MainScreenRouterProtocol {
    func presentDetailView(image: UIImage) {
        let detailViewController =  DetailViewWireFrame().buildDetailViewModule(image: image)

        // MARK: - not so clean solution

        self.mainScreenViewController.navigationController?.pushViewController(detailViewController, animated: true)
    }
}
