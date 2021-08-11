//
//  MainScreenInteractor.swift
//  VIPER_Project
//
//  Created by Denis Golovizin on 23.07.2021.
//

import Foundation
import UIKit

protocol MainScreenInteractorProtocol: AnyObject {
    func loadPicturesList(completion: ([JSONPlaceHolderPictureObject]) -> Void)
    func loadImage(index: Int, completion: (UIImage) -> Void)
}

final class MainScreenInteractor {
    private var mocPictureList: [JSONPlaceHolderPictureObject] = [
        JSONPlaceHolderPictureObject(id: 1,
                                     title: "aerial view of green trees during daytime",
                                     url: "aerial view of green trees during daytime"),
        JSONPlaceHolderPictureObject(id: 2,
                                     title: "white and pink flower in tilt shift lens",
                                     url: "white and pink flower in tilt shift lens"),
        JSONPlaceHolderPictureObject(id: 3,
                                     title: "black and white ceramic mugs on brown wooden table",
                                     url: "black and white ceramic mugs on brown wooden table"),
        JSONPlaceHolderPictureObject(id: 4,
                                     title: "white concrete building under blue sky during daytime",
                                     url: "white concrete building under blue sky during daytime")
    ]
}

// MARK: - MainScreenInteractorProtocol
extension MainScreenInteractor: MainScreenInteractorProtocol {
    func loadPicturesList(completion: ([JSONPlaceHolderPictureObject]) -> Void) {
        completion(mocPictureList)
    }

    func loadImage(index: Int, completion: (UIImage) -> Void) {
        let imageName = mocPictureList[index].url
        if let imageToShow = UIImage(named: imageName) {
            completion(imageToShow)
        }
    }
}
