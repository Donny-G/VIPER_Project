//
//  NetworkError.swift
//  VIPER_Project
//
//  Created by Denis Golovizin on 25.08.2021.
//

import Foundation

enum NetworkError: LocalizedError, Error {
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

    public var errorDescription: String? {
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
