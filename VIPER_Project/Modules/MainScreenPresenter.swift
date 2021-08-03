//
//  MainScreenPresenter.swift
//  VIPER_Project
//
//  Created by Denis Golovizin on 23.07.2021.
//

import Foundation
import UIKit

protocol MainScreenPresenterProtocol: AnyObject {
    func viewDidLoad(tableView: UITableView)
}

final class MainScreenPresenter: NSObject {
    private var pictures: [String]?

    private var interactor: MainScreenInteractorProtocol
    private var router: MainScreenRouterProtocol

    init(interactor: MainScreenInteractorProtocol, router: MainScreenRouterProtocol) {
        self.interactor = interactor
        self.router = router
    }
}

// MARK: - MainScreenPresenterProtocol
extension MainScreenPresenter: MainScreenPresenterProtocol {
    func viewDidLoad( tableView: UITableView) {
        tableView.delegate = self
        tableView.dataSource = self
        tableView.register(UITableViewCell.self, forCellReuseIdentifier: MainScreenEnum.cell.rawValue)

        let handler: ([JSONPlaceHolderPictureObject]) -> Void = { [weak self] in
            self?.pictures = $0.compactMap {$0.title}
            tableView.reloadData()
        }
        interactor.loadPicturesList(completion: handler)
    }
}

// MARK: - UITableViewDataSource, UITableViewDelegate
extension MainScreenPresenter: UITableViewDataSource, UITableViewDelegate {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        guard let pictures = self.pictures else { return 0 }
        return pictures.count
    }

    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        guard let pictures = self.pictures else { fatalError() }
        let cell = tableView.dequeueReusableCell(withIdentifier: MainScreenEnum.cell.rawValue, for: indexPath)
        cell.textLabel?.text = pictures[indexPath.row]
        cell.textLabel?.numberOfLines = 0
        return cell
    }
}
