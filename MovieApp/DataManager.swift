//
//  DataManager.swift
//  MovieApp
//
//  Created by USM Admin on 22/11/2023.
//

import Foundation
import Combine
import UIKit

enum MovieError: Error {
    case serverError
    case parsingError
    case noDataError
}

class DataManagerGenerics {

    
    func apiCallGeneric<T: Codable>(url: String) -> AnyPublisher<T, Error> {
        let headers = [
          "accept": "application/json",
          "Authorization": "Bearer eyJhbGciOiJIUzI1NiJ9.eyJhdWQiOiI0ODI4NjM2Y2YxYmU5NzA5ZjMxZWI0NmM0M2I4OTNkYSIsInN1YiI6IjY1NWFiM2JlZjY3ODdhMDBhZWNkMjliZCIsInNjb3BlcyI6WyJhcGlfcmVhZCJdLCJ2ZXJzaW9uIjoxfQ.y2jGSRjDa7LPCBKuwq_oyNK_S8C0JmPenKkjip65rxY"
        ]
        var request = URLRequest(url: NSURL(string: url)! as URL,cachePolicy: .useProtocolCachePolicy,timeoutInterval: 10.0)
        request.httpMethod = "GET"
        request.allHTTPHeaderFields = headers
        return URLSession.shared.dataTaskPublisher(for: request)
           .map { $0.data }
           .decode(type: T.self, decoder: JSONDecoder())
           .receive(on: RunLoop.main)
           .eraseToAnyPublisher()
       }
    
    func downloadImageUrl(_ urlString: String) async -> Data? {
        guard let url = URL(string: urlString) else {
            return nil
        }
        do {
            let (data, _) = try await URLSession.shared.data(from: url)
            return data
        }catch {
            return nil
        }
        
//        { (data, response, error) in
//            if let error = error {
//                print("error in downloading image: \(error)")
//                completion?(nil)
//                return
//            }
//            guard let httpResponse = response as? HTTPURLResponse,(200...299).contains(httpResponse.statusCode) else {
//                completion?(nil)
//                return
//            }
//            if let data = data {
//                completion?(data)
//                return
//            }
//            completion?(nil)
//        }.resume()
    }
    
//    func apiCallFavoriteMovie(url: String, completion: @escaping (Result<[Movie], MovieError>) -> ()) {
//        let headers = [
//          "accept": "application/json",
//          "Authorization": "Bearer eyJhbGciOiJIUzI1NiJ9.eyJhdWQiOiI0ODI4NjM2Y2YxYmU5NzA5ZjMxZWI0NmM0M2I4OTNkYSIsInN1YiI6IjY1NWFiM2JlZjY3ODdhMDBhZWNkMjliZCIsInNjb3BlcyI6WyJhcGlfcmVhZCJdLCJ2ZXJzaW9uIjoxfQ.y2jGSRjDa7LPCBKuwq_oyNK_S8C0JmPenKkjip65rxY"
//        ]
//        let request = NSMutableURLRequest(url: NSURL(string: url)! as URL,cachePolicy: .useProtocolCachePolicy,timeoutInterval: 10.0)
//        request.httpMethod = "GET"
//        request.allHTTPHeaderFields = headers
//        
//        let session = URLSession.shared
//        let dataTask = session.dataTask(with: request as URLRequest) { (data, response, error) in
//            if (error != nil) {
//                completion(.failure(.serverError))
//            }
//            guard let data = data else {
//                completion(.failure(.noDataError))
//                return
//            }
//            do {
//                let result = try JSONDecoder().decode(JSONStructure.self, from: data)
//                let movies = result.results
//                completion(.success(movies))
//            } catch {
//                completion(.failure(.parsingError))
//            }
//        }
//        dataTask.resume()
//    }
}

enum DataError:Error {
    case noDataAvailable
}
enum ValidationError: LocalizedError {
    case invalidValue
}
