//
//  MainScreenPresenter.swift
//  VIPER_Project
//
//  Created by Denis Golovizin on 23.07.2021.
//

import Foundation
import UIKit
import RealmSwift

protocol MainScreenPresenterProtocol: AnyObject {
    func viewDidLoad(tableView: UITableView)
    func openImageDownloader()
    func viewDidAppear(tableView: UITableView)
}

final class MainScreenPresenter: NSObject {
    private var pictures: [PictureDTO]?

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
        tableView.register(UITableViewCell.self,
                           forCellReuseIdentifier: NSLocalizedString("cell", comment: "Cell identfier"))

        interactor.loadPicturesList { result in
            switch result {
            case .success(let savedPictures):
                self.pictures = savedPictures
            case .failure(let error):
                self.router.presentAlert(with: error)
            }

        }
    }

    func openImageDownloader() {
        router.presentImageDownloaderView()
    }

    func viewDidAppear(tableView: UITableView) {
        interactor.loadPicturesList { result in
            switch result {
            case .success(let savedPictures):
                self.pictures = savedPictures
            case .failure(let error):
                self.router.presentAlert(with: error)
            }

        }
        tableView.reloadData()
    }
}

// MARK: - UITableViewDataSource, UITableViewDelegate
extension MainScreenPresenter: UITableViewDataSource, UITableViewDelegate {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return pictures?.count ?? 0
    }

    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: NSLocalizedString("cell",
            comment: "Cell identfier"),
            for: indexPath)
        if let pictures = self.pictures {
            cell.textLabel?.text = pictures[indexPath.row].title
        }
        cell.textLabel?.numberOfLines = 0
        return cell
    }

    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        interactor.loadImage(index: indexPath.row) { result in
            switch result {
            case .success(let image):
                self.router.presentDetailView(image: image)
            case .failure(let error):
                self.router.presentAlert(with: error)
            }

        }
    }

    func tableView(_ tableView: UITableView,
                   commit editingStyle: UITableViewCell.EditingStyle,
                   forRowAt indexPath: IndexPath) {
        if editingStyle == .delete {
            if let item = pictures?[indexPath.row] {

                RealmDBRepository.init().deleteFromDB(objectId: item.identifier) { result in
                    switch result {
                    case .success():
                        self.pictures?.remove(at: indexPath.row)
                        tableView.deleteRows(at: [indexPath], with: UITableView.RowAnimation.none)
                    case .failure(let error):
                        self.router.presentAlert(with: error)
                    }
                }
            }
        }
    }
}
