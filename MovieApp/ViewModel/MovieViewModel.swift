//
//  MovieViewModel.swift
//  MovieApp
//
//  Created by USM Admin on 23/11/2023.
//

import Foundation

struct MovieViewModel: Codable {
    var id: Int?
    var overview: String?
    var title: String?
    var poster_image: Data?
    var release_year: String?
    var vote_average: Int
    var backdrop_image: Data?
    var genres: [String]?
    var isFavourite: Bool = false
    var score: Int = 0
}
