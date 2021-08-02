//
//  Entities.swift
//  VIPER_Project
//
//  Created by Denis Golovizin on 23.07.2021.
//

import Foundation

// https://api.unsplash.com/photos/random/?count=30&client_id=Sbm7RJG_slwipphqq8w3GFW9mcAK3ZEgK3nc0E4lx1Y

struct Picture: Codable {
    let id: String
    let altDescription: String
    let urls: Urls

    enum CodingKeys: String, CodingKey {
        case id
        case altDescription = "alt_description"
        case urls
    }
}

struct Urls: Codable {
    let raw, full, regular, small: String
    let thumb: String
}
