//
//  ImageDownloaderInteractor.swift
//  VIPER_Project
//
//  Created by Denis Golovizin on 12.08.2021.
//

import Foundation
import UIKit

protocol ImageDownloaderInteractorProtocol: AnyObject {
    func loadImage(from url: URL,
                   completion: @escaping (Result <UIImage, NetworkError>) -> Void)
    func saveToRealmDB(title: String, image: UIImage, completion: @escaping (Result <Void, ApplicationError>) -> Void)
}

final class ImageDownloaderInteractor {

}

// MARK: - ImageDownloaderInteractorProtocol
extension ImageDownloaderInteractor: ImageDownloaderInteractorProtocol {
    func loadImage(from url: URL, completion: @escaping (Result <UIImage, NetworkError>) -> Void) {
        NetworkImageLoader.fetchImage(from: url) { result in
            completion(result)
        }
    }

    func saveToRealmDB(title: String, image: UIImage, completion: @escaping (Result <Void, ApplicationError>) -> Void) {
        RealmObjectManager.saveToRealmDB(title: title, image: image) { result in
            completion(result)
        }
    }
}
