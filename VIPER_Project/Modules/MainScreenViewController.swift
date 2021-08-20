//
//  ViewController.swift
//  VIPER_Project
//
//  Created by Denis Golovizin on 22.07.2021.
//

import UIKit

final class MainScreenViewController: UIViewController {
    var presenter: MainScreenPresenterProtocol?

    private var tableView = UITableView()

    override func loadView() {
        super.loadView()
        self.view = tableView
        title = NSLocalizedString("title", comment: "App title")
    }

    override func viewDidLoad() {
        super.viewDidLoad()
        presenter?.viewDidLoad(tableView: tableView)

        navigationItem.rightBarButtonItem = UIBarButtonItem(image: InterfaceIconsEnum.enterUrlButton.image,
                                                            style: .plain,
                                                            target: self,
                                                            action: #selector(urlView))
    }

    @objc func urlView() {
        presenter?.openImageDownloader()
    }
}
