//
//  NetworkManager.swift
//  VIPER_Project
//
//  Created by Denis Golovizin on 26.07.2021.
//

import Foundation

enum NetworkError: Error {
    case invalidURL
    case invalidData
}

struct NetworkManager {
    private func createRequest(url: String) -> URLRequest? {
        guard let url = URL(string: url) else { return nil}
        var request = URLRequest(url: url)
        request.httpMethod = "GET"
        request.setValue("application/json; charset=utf-8", forHTTPHeaderField: "Content-Type")
        return request
    }

    private func executeRequest<T: Codable>(request: URLRequest, completion: ((T?, Error?) -> Void)?) {
        let session = URLSession(configuration: .default)
        session.dataTask(with: request) { (data, _, error ) in
            guard let data = data else {
                completion?(nil, error)
                return
            }
            if let decodedResponse = try? JSONDecoder().decode(T.self, from: data) {
                DispatchQueue.main.async {
                    completion?(decodedResponse, nil)
                }
            } else {
                completion?(nil, NetworkError.invalidData)
            }
        }
        .resume()
    }

    typealias ObjectCompletionClosure = (([PictureObject]?, Error?) -> Void)

    public func fetchData(completion: ObjectCompletionClosure?) {
        guard let request = createRequest(url: "https://jsonplaceholder.typicode.com/photos")
        else { completion?(nil, NetworkError.invalidURL)
            return
        }
        executeRequest(request: request, completion: completion)
    }
}
