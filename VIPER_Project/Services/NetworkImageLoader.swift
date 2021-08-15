//
//  NetworkImageManager.swift
//  VIPER_Project
//
//  Created by Denis Golovizin on 13.08.2021.
//

import Foundation
import UIKit

enum NetworkImageLoaderEnum: String {
    case unknownError = "Unknown error"
}

struct NetworkImageLoader {

    public func fetchImage(
        inputURL: String,
        imageCompletion: @escaping (UIImage) -> Void,
        errorCompletion: @escaping (String) -> Void
    ) {
        if let url = URL(string: inputURL) {
            let dataTask = URLSession.shared.dataTask(with: url) { data, _, error in
                guard let data = data, error == nil else {
                    errorCompletion(error?.localizedDescription ?? NetworkImageLoaderEnum.unknownError.rawValue)
                    return }

                let outputImage = UIImage(data: data)
                let errorImage = UIImage(systemName: InterfaceIconsEnum.errorImage.rawValue)

                imageCompletion((outputImage ?? errorImage)! )
            }
            dataTask.resume()
        }
    }
}
