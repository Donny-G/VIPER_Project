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
    func openImageDownloader()
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
    func viewDidLoad(tableView: UITableView) {
        tableView.delegate = self
        tableView.dataSource = self
        tableView.register(UITableViewCell.self, forCellReuseIdentifier: MainScreenEnum.cell.rawValue)

        let handler: ([JSONPlaceHolderPictureObject]) -> Void = { [weak self] in
            self?.pictures = $0.compactMap { $0.title }
            tableView.reloadData()
        }
        interactor.loadPicturesList(completion: handler)
    }

    func openImageDownloader() {
        router.presentImageDownloaderView()
    }
}

// MARK: - UITableViewDataSource, UITableViewDelegate
extension MainScreenPresenter: UITableViewDataSource, UITableViewDelegate {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        if let pictures = self.pictures {
            return pictures.count
        }
        return 0
    }

    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: MainScreenEnum.cell.rawValue, for: indexPath)
        if let pictures = self.pictures {
            cell.textLabel?.text = pictures[indexPath.row]
        }
        cell.textLabel?.numberOfLines = 0
        return cell
    }

    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        let handler: (UIImage) -> Void = {image in
            self.router.presentDetailView(image: image)
        }
        interactor.loadImage(index: indexPath.row, completion: handler)
    }
}
