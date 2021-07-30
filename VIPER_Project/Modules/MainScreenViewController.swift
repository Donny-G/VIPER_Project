//
//  ViewController.swift
//  VIPER_Project
//
//  Created by Denis Golovizin on 22.07.2021.
//

import UIKit

protocol MainScreenViewProtocol: AnyObject {
    func feedbackFromPresenter()
}

final class MainScreenViewController: UIViewController, UITableViewDataSource, UITableViewDelegate {

    var presenter: MainScreenPresenterProtocol?

    private var tableView = UITableView()

    override func viewDidLoad() {
        super.viewDidLoad()
        presenter?.viewDidLoad(tableView: &tableView, viewController: self)

        title = "VIPER Project"
    }

    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return presenter?.numberOfRowInSection() ?? 0
    }

    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "Cell", for: indexPath)
        cell.textLabel?.text = presenter?.textLabel(indexPath: indexPath)
        return cell
    }
}

// MARK: - MainScreenViewProtocol
extension MainScreenViewController: MainScreenViewProtocol {
    func feedbackFromPresenter() {
        // self.tableView.reloadData()
    }
}
