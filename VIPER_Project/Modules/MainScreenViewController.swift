//
//  ViewController.swift
//  VIPER_Project
//
//  Created by Denis Golovizin on 22.07.2021.
//

import UIKit

protocol MainScreenViewProtocol: AnyObject {
    var presenter: MainScreenPresenterProtocol? { get set }
    func uploadDataFromPresenter(objects: [Object])
}

class MainScreenViewController: UITableViewController, MainScreenViewProtocol {
    var presenter: MainScreenPresenterProtocol?
    var objects: ObjectModel = [] {
        didSet {
            tableView.reloadData()
        }
    }
    override func viewDidLoad() {
        super.viewDidLoad()
        print("number of objects at start: \(objects.count)")
        MainScreenWireFrame().buildModule(module: self)
        presenter?.sendRequestForDataToInteractor()
        tableView.register(UITableViewCell.self, forCellReuseIdentifier: "Cell")
        title = "VIPER Project"
    }
    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return objects.count
    }
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "Cell", for: indexPath)
        cell.textLabel?.text = objects.debugDescription
        return cell
    }
    func uploadDataFromPresenter(objects: ObjectModel) {
        self.objects = objects
        self.tableView.reloadData()
        print("number of objects at end: \(objects.count)")
    }

}
