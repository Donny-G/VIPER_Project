//
//  RealmImageObject.swift
//  VIPER_Project
//
//  Created by Denis Golovizin on 24.08.2021.
//

import Foundation
import RealmSwift

class RealmImageObject: Object {
    @Persisted var title: String
    @Persisted var image: Data?

    convenience init(title: String, image: Data?) {
        self.init()
        self.title = title
        self.image = image
    }
}
