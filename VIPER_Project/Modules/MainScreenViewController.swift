//
//  ViewController.swift
//  VIPER_Project
//
//  Created by Denis Golovizin on 22.07.2021.
//

import UIKit

class MainScreenViewController: UITableViewController {
   
    override func viewDidLoad() {
        super.viewDidLoad()
        tableView.register(UITableViewCell.self, forCellReuseIdentifier: "Cell")
        title = "VIPER Project"
    }
    
    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        4
    }
    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "Cell", for: indexPath)
        cell.textLabel?.text = "test"
        return cell
    }


}

