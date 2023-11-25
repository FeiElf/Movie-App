//
//  Genre.swift
//  MovieApp
//
//  Created by USM Admin on 24/11/2023.
//

import Foundation

struct Genre: Codable {
    var id: Int
    var name: String
}

struct GenreStructure: Codable {
    var genres: [Genre]
    
    private enum CodingKeys: String, CodingKey {
        case genres = "genres"
     }
    
    init(from decoder: Decoder) throws {
        let container = try decoder.container(keyedBy: CodingKeys.self)
        self.genres = try container.decode([Genre].self, forKey: .genres)
    }
}
