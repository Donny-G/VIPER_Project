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
    case badRequest
    case accessError(HTTPURLResponse)
    case notFound
    case otherClientError(HTTPURLResponse)
    case serverError(HTTPURLResponse)
    case otherStatucCode(HTTPURLResponse)

    func localizedDescription() -> String {
        switch self {
        case .invalidData:
            return "Invalid data, please check the source link"
        case .networkFailure(let someError):
            return "Error: \(String(describing: someError.localizedDescription))"
        case .badRequest:
            return "Bad Request"
        case .accessError(let status):
            return "Access error: \(status.statusCode)"
        case .notFound:
            return "404 not found: the resource is not found"
        case .otherClientError(let status):
            return "Client error: \(status.statusCode)"
        case .serverError(let status):
            return "Server error: \(status.statusCode)"
        case .otherStatucCode(let status):
            return "HTTP URL Response Status Code: \(status.statusCode)"
        case .unknownError:
            return "Unknown error"
        case .unsupportedURL:
            return "Error: unsupported URL"
        }
    }
}

struct NetworkImageLoader {

    static func fetchImage(from url: URL, completion: @escaping (Result <UIImage, ImageLoaderError>) -> Void) {
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
                          let outputImage = UIImage(data: data) else { return completion(.failure(.invalidData)) }
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
