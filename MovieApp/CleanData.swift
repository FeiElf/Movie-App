//
//  CleanData.swift
//  MovieApp
//
//  Created by USM Admin on 23/11/2023.
//

import Foundation
import Combine

class CleanData {

    func refactorAndInsertIntoViewModel(data: [Movie], genres: [Genre]) -> Future <[MovieViewModel], AsyncError> {
        var newDate = false;
        var array = [MovieViewModel]()
        for movie in data {
            let imageBaseUrl: String = "https://image.tmdb.org/t/p/w500"
            
            // movie_id
            let id: Int? = movie.id
            
            // title
            var title: String? = movie.title
            
            // overview
            var overview: String? = movie.overview
            
            // poster path
            var poster_image: Data?
            DataManagerGenerics().downloadImageUrl("\(imageBaseUrl)\(movie.poster_path)"){_image in
                    poster_image = _image
            }
 
            // release year
            let result: [String]? = movie.release_date.components(separatedBy: "-")
            var release_year: String? = result?[0]
                    
            // vote average
            let vote_average: Int = Int(movie.vote_average! * 10)
                        
            // backdrop path
            var backdrop_image: Data?
            DataManagerGenerics().downloadImageUrl("\(imageBaseUrl)\(movie.poster_path)"){_image in
                    poster_image = _image
            }
            
            // genres
            let genres_list: [String]? = movie.genre_ids.map{
                return genreNameReturn(id: $0)
            }
            
            func genreNameReturn(id: Int) -> String {
                return genres.first(where: {
                    $0.id == id})?.name ?? ""
            }
            
            var input = MovieViewModel(id: id, overview: overview, title: title, poster_image: poster_image, release_year: release_year,
             vote_average: vote_average, backdrop_image: backdrop_image, genres: genres_list)
            array.append(input)
        }
        
        // sorting movies by rating
        array = array.sorted { $0.vote_average > $1.vote_average }
        return Future() { promise in
                array.count < 1 ? promise(Result.failure(AsyncError.message("Re fail"))) : promise(Result.success(array)); array.removeAll()
        }
    }
    
}
