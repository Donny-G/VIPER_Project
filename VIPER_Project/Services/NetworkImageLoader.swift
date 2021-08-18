//
//  NetworkImageManager.swift
//  VIPER_Project
//
//  Created by Denis Golovizin on 13.08.2021.
//

import Foundation
import UIKit

enum ImageLoaderError: Error {
    case unsupportedURL
    case unknownError
    case networkFailure(Error)
    case invalidData
    case unexpectedStatus(HTTPURLResponse)
}

struct NetworkImageLoader {

    public func fetchImage(inputURL: String, completion: @escaping (Result <UIImage, ImageLoaderError>) -> Void) {
        guard let url = URL(string: inputURL) else { completion(.failure(.unsupportedURL))
            return
        }
        let dataTask = URLSession.shared.dataTask(with: url) { data, response, error in
            if let error = error {
                completion(.failure(.networkFailure(error)))
            }
            if let httpResponse = response as? HTTPURLResponse {
                if (200 ... 299).contains(httpResponse.statusCode) {
                    if let data = data {
                        let outputImage = UIImage(data: data)
                        let errorImage = UIImage(systemName: InterfaceIconsEnum.errorImage.rawValue)
                        completion(.success((outputImage ?? errorImage)!))
                    } else {
                        completion(.failure(.invalidData))}
                } else {
                    completion(.failure(.unexpectedStatus(httpResponse)))
                }
            } else {
                completion(.failure(.unknownError))
            }
        }
        dataTask.resume()
    }
}
