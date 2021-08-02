//
//  MainScreenRouter.swift
//  VIPER_Project
//
//  Created by Denis Golovizin on 23.07.2021.
//

import Foundation
import UIKit

protocol MainScreenRouterProtocol: AnyObject {
    func presentDetailView(from view: UIViewController)
}

final class MainScreenRouter {
}

// MARK: - MainScreenRouterProtocol
extension MainScreenRouter: MainScreenRouterProtocol {
    func presentDetailView(from view: UIViewController) {
        let detailViewController = DetailViewRouter().buildDetailViewModule()

        view.navigationController?.pushViewController(detailViewController, animated: true)
    }
}
