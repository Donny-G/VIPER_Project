//
//  NetworkImageManager.swift
//  VIPER_Project
//
//  Created by Denis Golovizin on 13.08.2021.
//

import Foundation
import UIKit

struct NetworkImageLoader {

    static func fetchImage(from url: URL, completion: @escaping (Result <UIImage, NetworkError>) -> Void) {
        let dataTask = URLSession.shared.dataTask(with: url) { data, response, error in
            if let error = error {
                return completion(.failure(.networkFailure(error)))
            }
            guard let httpResponse = response as? HTTPURLResponse else {
                return completion(.failure(.unknownError))
            }
            switch httpResponse.statusCode {
            case 200...299:
                guard let data = data,
                      let outputImage = UIImage(data: data) else {
                          return completion(.failure(.invalidData))
                      }
                completion(.success((outputImage)))
            case 400:
                completion(.failure(.badRequest))
            case 401...403:
                completion(.failure(.accessError(httpResponse)))
            case 404:
                completion(.failure(.notFound))
            case 405...499:
                completion(.failure(.otherClientError(httpResponse)))
            case 505...:
                completion(.failure(.serverError(httpResponse)))
            default:
                completion(.failure(.otherStatucCode(httpResponse)))
            }
        }
        dataTask.resume()
    }
}
