//
//  ImageDownloaderInteractor.swift
//  VIPER_Project
//
//  Created by Denis Golovizin on 12.08.2021.
//

import Foundation
import UIKit

protocol ImageDownloaderInteractorProtocol {
    func loadImage(
        from url: String?,
        imageCompletion: @escaping (UIImage) -> Void,
        errorCompletion: @escaping (String) -> Void
    )
}

final class ImageDownloaderInteractor {

}

extension ImageDownloaderInteractor: ImageDownloaderInteractorProtocol {

    func loadImage(
        from url: String?,
        imageCompletion: @escaping (UIImage) -> Void,
        errorCompletion: @escaping (String) -> Void
    ) {
        if let url = url {
            NetworkImageLoader().fetchImage(inputURL: url) { image in
                imageCompletion(image)
            } errorCompletion: { error in
                errorCompletion(error)
            }
        }
    }
}
