//
//  AlertMessageManager.swift
//  VIPER_Project
//
//  Created by Denis Golovizin on 18.08.2021.
//

import Foundation

struct AlertMessage {
    static func getMessage(from error: ImageLoaderError) -> String {
        switch error {
        case .invalidData:
            return "Invalid data, please check the source link"
        case .networkFailure(let someError):
            return "Check your internet connection \(someError)"
        case .unexpectedStatus(let status):
            return "Wrong HTTP URL Response status: \(status)"
        case .unknownError:
            return "Unknown error"
        case .unsupportedURL:
            return "Incorrect URL link"
        }
    }
}
