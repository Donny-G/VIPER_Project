//
//  MainScreenInteractor.swift
//  VIPER_Project
//
//  Created by Denis Golovizin on 23.07.2021.
//

import Foundation
import UIKit
import RealmSwift

protocol MainScreenInteractorProtocol: AnyObject {
    func loadPicturesList(completion: @escaping (Result <Results<RealmImageObject>, ApplicationError>) -> Void)
    func loadImage(index: Int, completion: @escaping (Result <UIImage, ApplicationError>) -> Void)
}

final class MainScreenInteractor {

}

// MARK: - MainScreenInteractorProtocol
extension MainScreenInteractor: MainScreenInteractorProtocol {
    func loadPicturesList(completion: @escaping (Result <Results<RealmImageObject>, ApplicationError>) -> Void) {
        RealmObjectManager.loadRealmDB { result in
            completion(result)
        }
    }

    func loadImage(index: Int, completion: @escaping (Result <UIImage, ApplicationError>) -> Void) {
        RealmObjectManager.loadRealmDB { result in
            switch result {
            case .success(let savedImages):
                if let imageData = savedImages[index].image, let imageToLoad = UIImage(data: imageData) {
                    completion(.success(imageToLoad))
                }
            case .failure(let error):
                completion(.failure(error))
            }
        }
    }
}
