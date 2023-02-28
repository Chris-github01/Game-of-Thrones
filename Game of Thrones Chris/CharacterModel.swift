//
//  Characters.swift
//  Game of Thrones Chris
//
//  Created by Christopher Knight on 2023/02/10.
//

// This file was generated from JSON Schema using quicktype, do not modify it directly.
// To parse the JSON, add this file to your project and do:
//
//   let gOTData = try? JSONDecoder().decode(GOTData.self, from: jsonData)

import Foundation

// MARK: - GOTDatum
struct Character: Codable {
    let id: Int?
    let firstName, lastName, fullName, title: String?
    let family, image: String?
    let imageURL: String?

    enum CodingKeys: String, CodingKey {
        case id, firstName, lastName, fullName, title, family, image
        case imageURL = "imageUrl"
    }
}

typealias CharacterData = [Character]
