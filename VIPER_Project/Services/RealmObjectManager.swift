//
//  RealmObjectManager.swift
//  VIPER_Project
//
//  Created by Denis Golovizin on 24.08.2021.
//

import Foundation
import RealmSwift

struct RealmObjectManager {

    static func saveToRealmDB(title: String,
                              image: UIImage,
                              completion: @escaping (Result <Void, ApplicationError>) -> Void) {
        guard let realmDB = try? Realm() else {
            return completion(.failure(.realmError))
        }
        let imageData = image.jpegData(compressionQuality: 1)
        let objectToSave = RealmImageObject(title: title, image: imageData)

        do {
            try realmDB.write({
                realmDB.add(objectToSave)
            })
            completion(.success(()))
        } catch {
            completion(.failure(.savingError(error)))
        }
    }

    static func loadRealmDB(completion: @escaping (Result <Results<RealmImageObject>, ApplicationError>) -> Void) {
        guard let realmDB = try? Realm() else { return completion(.failure(.realmError))
        }
        completion(.success(realmDB.objects(RealmImageObject.self)))
    }

    static func deleteFromRealmDB(record: RealmImageObject,
                                  completion: @escaping (Result <Void, ApplicationError>) -> Void) {
        guard let realmDB = try? Realm() else {
            return completion(.failure(.realmError))
        }

        do {
            try realmDB.write({
                realmDB.delete(record)
            })
            completion(.success(()))
        } catch {
            completion(.failure(.savingError(error)))
        }
    }
}
