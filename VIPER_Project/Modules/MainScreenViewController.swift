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
        title = MainScreenEnum.title.rawValue
    }

    override func viewDidLoad() {
        super.viewDidLoad()
        presenter?.viewDidLoad(tableView: tableView)
    }

    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        presenter?.didSelectRowAt(from: self, index: indexPath.row)
    }
}
