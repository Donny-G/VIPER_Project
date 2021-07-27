//
//  MainScreenInteractor.swift
//  VIPER_Project
//
//  Created by Denis Golovizin on 23.07.2021.
//

import Foundation

protocol MainScreenInteractorProtocol: AnyObject {
    var presenter: MainScreenPresenterProtocol? { get set }
    func retrieveData()
}

class MainScreenInteractor: MainScreenInteractorProtocol {
  var objects: [Object]?
    /*{
        var tempobjects = [Object]()
        for item in testData {
            tempobjects.append(item)
        }
        return tempobjects
    }
    */
    weak var presenter: MainScreenPresenterProtocol?
    func network() {
        NetworkManager().fetchData { data, error in
            if let data = data {
                for item in data {
                    self.objects?.append(item)
                    // сами обьекты мы видим
                    print(item.self)
                    // но в массив не попадают
                    print(self.objects?.count)
                }
            } else {
                print(error)
            }
        }
        print("number \(objects?.count)")
    }
    func retrieveData() {
        network()
        presenter?.didRetrieveData(objects: objects ?? [])
    }
}
