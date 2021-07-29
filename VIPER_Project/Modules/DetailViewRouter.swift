//
//  DetailViewRouter.swift
//  VIPER_Project
//
//  Created by Denis Golovizin on 29.07.2021.
//

import Foundation
import UIKit

protocol DetailViewRouterProtocol {
    func buildDetailViewModule() -> UIViewController
}

final class DetailViewRouter {

}

// MARK: - DetailViewRouterProtocol
extension DetailViewRouter: DetailViewRouterProtocol {
    func buildDetailViewModule() -> UIViewController {
        let detailViewController = DetailViewViewController()
        return detailViewController
    }

}
