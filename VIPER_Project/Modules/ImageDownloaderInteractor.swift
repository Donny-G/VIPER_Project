//
//  ImageDownloaderInteractor.swift
//  VIPER_Project
//
//  Created by Denis Golovizin on 12.08.2021.
//

import Foundation
import UIKit

protocol ImageDownloaderInteractorProtocol: AnyObject {
    func loadImage(
        from url: String?,
        completion: @escaping (Result <UIImage, ImageLoaderError>) -> Void)
}

final class ImageDownloaderInteractor {

}

extension ImageDownloaderInteractor: ImageDownloaderInteractorProtocol {
    func loadImage(from url: String?, completion: @escaping (Result <UIImage, ImageLoaderError>) -> Void) {
        if let url = url {
            NetworkImageLoader().fetchImage(inputURL: url) { result in
                switch result {
                case .success(let image):
                    completion(.success(image))
                case .failure(let error):
                    completion(.failure(error))
                }
            }
        }
    }
}
