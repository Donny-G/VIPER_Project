//
//  ApplicationError.swift
//  VIPER_Project
//
//  Created by Denis Golovizin on 25.08.2021.
//

import Foundation

enum ApplicationError: LocalizedError, Error {
    case emptyTitle
    case noImageToSave
    case unableToLoadFromRealmDB
    case savingError(Error)
    case unknownError(Error)
    case realmError

    public var errorDescription: String? {
        switch self {
        case .emptyTitle:
            return "Please, enter the title for image"
        case .noImageToSave:
            return "Please, enter URL for image"
        case .unableToLoadFromRealmDB:
            return "Database error during loading"
        case .savingError(let error):
            return "Error during saving: \(error)"
        case .unknownError(let error):
            return "Unknown error: \(error)"
        case .realmError:
            return "Error with Realm"
        }
    }
}
