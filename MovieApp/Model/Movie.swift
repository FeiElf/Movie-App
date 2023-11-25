//
//  Movie.swift
//  MovieApp
//
//  Created by USM Admin on 22/11/2023.
//

import Foundation

struct Movie: Codable {
    var id: Int?
    var adult: Bool
    var popularity: Float?
    var overview: String?
    var title: String?
    var video: Bool
    var poster_path: String
    var release_date: String
    var vote_average: Float?
    var vote_count: Int?
    var backdrop_path: String?
    var genre_ids: [Int]
    var original_language: String?
    var original_title: String?
    
}

struct JSONStructure: Codable {
    var page: Int?
    var total_results: Int?
    var results: [Movie]
    var total_pages: Int?
    
    private enum CodingKeys: String, CodingKey {
        case page
        case total_results
        case results
        case total_pages
     }
    
    init(from decoder: Decoder) throws {
        let container = try decoder.container(keyedBy: CodingKeys.self)
        self.page = try container.decode(Int.self, forKey: .page)
        self.total_results = try container.decode(Int.self, forKey: .total_results)
        self.results = try container.decode([Movie].self, forKey: .results)
        self.total_pages = try container.decode(Int.self, forKey: .total_pages)
    }
}

