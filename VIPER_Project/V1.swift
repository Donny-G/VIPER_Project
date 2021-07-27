//
//  Entity.swift
//  VIPER_Project
//
//  Created by Denis Golovizin on 23.07.2021.
//

import Foundation

//https://jsonplaceholder.typicode.com/photos

struct Object: Codable {
    let id: Int
    let title: String
    let url: String

    enum CodingKeys: String, CodingKey {
        case id, title, url
    }
}

 typealias ObjectModel = [Object]
