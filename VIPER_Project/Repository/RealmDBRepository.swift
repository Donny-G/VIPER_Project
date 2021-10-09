//
//  RealmDBRepository.swift
//  VIPER_Project
//
//  Created by Denis Golovizin on 27.08.2021.
//

import Foundation
import UIKit
import RealmSwift

protocol RealmDBRepositoryProtocol: AnyObject {

    func loadFromDB(completion: @escaping(Result<[Picture], Error>) -> Void)
    func saveToDB(title: String,
                  image: UIImage, completion: @escaping(Result <Void, Error>) -> Void)
    func deleteFromDB(objectId: UUID, completion: @escaping(Result <Void, Error>) -> Void)
}

class RealmDBRepository {
    private var realm: Realm? {
        do {
            return try Realm()
        } catch let error {
            fatalError(error.localizedDescription)
        }
    }
}

// MARK: - RealmDBRepositoryProtocol
extension RealmDBRepository: RealmDBRepositoryProtocol {

    typealias DomainObject = Picture
    typealias RealmObject = PictureRealmDTO

    func loadFromDB(completion: @escaping(Result<[DomainObject], Error>) -> Void) {
        guard  let realmData = realm?.objects(RealmObject.self) else {
            return completion(.failure(ApplicationError.realmError)) }
        guard let errorImage = UIImage(systemName: InterfaceIconsEnum.errorImage.rawValue) else { return }

        var picturesArray: [DomainObject] {
            return realmData.compactMap { object in
                DomainObject(title: object.title,
                             image: UIImage(data: object.image) ?? errorImage,
                             identifier: object.identifier)
            }
        }

        if !picturesArray.isEmpty {
            completion(.success(picturesArray))
        } else {
            completion(.failure(ApplicationError.unableToLoadFromRealmDB))
        }
    }

    func saveToDB(title: String, image: UIImage, completion: @escaping(Result <Void, Error>) -> Void) {
        guard let imageData = image.jpegData(compressionQuality: 1) else {
            return completion(.failure(ApplicationError.noImageToSave)) }
        let objectToSave = RealmObject(title: title, image: imageData, identifier: UUID())

        do {
            try realm?.write({
                realm?.add(objectToSave)
            })
            completion(.success(()))
        } catch {
            completion(.failure(ApplicationError.savingError(error)))
        }
    }

    func deleteFromDB(objectId: UUID, completion: @escaping(Result <Void, Error>) -> Void) {
        let realmData = realm?.objects(RealmObject.self)
        guard let objectToDelete = realmData?.filter("identifier = %@", objectId) else { return
            completion(.failure(ApplicationError.realmError))
        }
        do {
            try realm?.write({
                realm?.delete(objectToDelete)
            })
            completion(.success(()))
        } catch {
            completion(.failure(ApplicationError.savingError(error)))
        }
    }
}
