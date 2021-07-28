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

    private var presenter: MainScreenPresenterProtocol?

    private var tableView = UITableView()

    override func viewDidLoad() {
        super.viewDidLoad()
        tableView = UITableView(frame: self.view.bounds, style: UITableView.Style.plain)
        tableView.delegate = self
        tableView.dataSource = self
        tableView.register(UITableViewCell.self, forCellReuseIdentifier: "Cell")
        view.addSubview(tableView)
     //   presenter?.viewDidLoad()
    //    MainScreenWireFrame().buildModule(module: self)
        title = "VIPER Project"
    }

    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 10
    }

    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "Cell", for: indexPath)
        cell.textLabel?.text = "test"
        return cell
    }

}

// MARK: - MainScreenViewProtocol
extension MainScreenViewController: MainScreenViewProtocol {
    func feedbackFromPresenter() {
        print("feedbackFromPresenter")
        self.tableView.reloadData()
    }
}