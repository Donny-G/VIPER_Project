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
    func loadPicturesList(completion: @escaping (Result <[PictureDTO], Error>) -> Void)
    func loadImage(index: Int, completion: @escaping (Result <UIImage, ApplicationError>) -> Void)
}

final class MainScreenInteractor {

}

// MARK: - MainScreenInteractorProtocol
extension MainScreenInteractor: MainScreenInteractorProtocol {
    func loadPicturesList(completion: @escaping (Result <[PictureDTO], Error>) -> Void) {
        RealmDBRepository.init().loadFromDB { result in
            completion(result)
        }
    }

    func loadImage(index: Int, completion: @escaping (Result <UIImage, ApplicationError>) -> Void) {
        RealmDBRepository.init().loadFromDB { result in
            switch result {
            case .success(let savedImages):
                completion(.success(savedImages[index].image))
            case .failure(let error):
                completion(.failure(ApplicationError.unableToLoadFromRealmDB))
            }
        }
    }
}
