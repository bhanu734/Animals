//
//  Animal.swift
//  Animalsapp
//
//  Created by Mac on 15/11/22.
//

import Foundation

// MARK: - Animal
struct Animal: Codable {
    let coverId: Int?
    let coverImage: String?
    
    let id, name, headline, animalDescription: String?
    let link: String?
    let image: String?
    let gallery, fact: [String]?

    enum CodingKeys: String, CodingKey {
        case coverId
        case coverImage
        case id, name, headline
        case animalDescription = "description"
        case link, image, gallery, fact
    }
}

typealias Animals = [Animal]
