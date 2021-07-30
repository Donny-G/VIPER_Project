//
//  MainScreenPresenter.swift
//  VIPER_Project
//
//  Created by Denis Golovizin on 23.07.2021.
//

import Foundation
import UIKit

 protocol MainScreenPresenterProtocol: AnyObject {
    func viewDidLoad(tableView: inout UITableView, viewController: UIViewController)
    func numberOfRowInSection() -> Int
    func textLabel(indexPath: IndexPath) -> String?
}

final class MainScreenPresenter {
    private var pictures: [String]?

    var interactor: MainScreenInteractorProtocol?
    var router: MainScreenRouterProtocol?
    // weak var view: MainScreenViewController?
}

// MARK: - MainScreenPresenterProtocol
extension MainScreenPresenter: MainScreenPresenterProtocol {

    func viewDidLoad( tableView: inout UITableView, viewController: UIViewController) {
        tableView = UITableView(frame: viewController.view.bounds, style: UITableView.Style.plain)
        tableView.delegate = viewController as? UITableViewDelegate
        tableView.dataSource = viewController as? UITableViewDataSource
        tableView.register(UITableViewCell.self, forCellReuseIdentifier: "Cell")
        viewController.view.addSubview(tableView)

        let handler: ([PictureObject]) -> Void = { [weak self] in
            self?.pictures = $0.compactMap {$0.title}
            tableView.reloadData()
        }
        interactor?.loadPicturesList(completion: handler)
    }

    func numberOfRowInSection() -> Int {
        guard let pictures = self.pictures else { return 0 }
        return pictures.count
    }

    func textLabel(indexPath: IndexPath) -> String? {
        guard let pictures = self.pictures else { return nil }
        return pictures[indexPath.row]
    }
}
