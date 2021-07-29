//
//  MainScreenInteractor.swift
//  VIPER_Project
//
//  Created by Denis Golovizin on 23.07.2021.
//

import Foundation

protocol MainScreenInteractorProtocol: AnyObject {
    func loadPicturesList(completion: ([PictureObject]) -> Void)
}

final class MainScreenInteractor {
    private var mocPictureList: [PictureObject] = [PictureObject(id: 678, title:
                                                                    "accusamus beatae ad facilis cum similique quit",
                                                            url: "https://via.placeholder.com/600/92c952"),
                                                  PictureObject(id: 465, title: "reprehenderit est deseruntvelit ipsam",
                                                                url: "https://via.placeholder.com/600/771796"),
                                                  PictureObject(id: 98,
                                                                title: "officia porro iure quia iusto qui ipsa ut modi",
                                                                url: "https://via.placeholder.com/600/24f355"),
                                                  PictureObject(id: 98,
                                                                title: "officia porro iure quia iusto qui ipsa ut modi",
                                                                url: "https://via.placeholder.com/600/24f355")]
}

// MARK: - MainScreenInteractorProtocol
extension MainScreenInteractor: MainScreenInteractorProtocol {
    func loadPicturesList(completion: ([PictureObject]) -> Void) {
        print("load pictures and send back")
        completion(mocPictureList)
    }
}
