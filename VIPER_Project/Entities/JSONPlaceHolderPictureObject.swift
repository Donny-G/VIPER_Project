//
//  JSONPlaceHolderPictureObject.swift
//  VIPER_Project
//
//  Created by Denis Golovizin on 04.08.2021.
//

import Foundation

// https://jsonplaceholder.typicode.com/photos

struct JSONPlaceHolderPictureObject: Codable {
    let id: Int
    let title: String
    let url: String

    enum CodingKeys: String, CodingKey {
        case id, title, url
    }
}
