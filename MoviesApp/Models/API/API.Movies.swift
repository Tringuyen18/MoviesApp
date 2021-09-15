//
//  API.Movies.swift
//  MoviesApp
//
//  Created by Nguyễn Trí on 13/08/2021.
//

import Foundation

extension APIManager.Movies {
    
    struct QueryString {
        func topMovies(limit: Int) -> String {
            return APIManager.Path.base_Domain +
                APIManager.Path.base_Path +
                APIManager.Path.movie_Path +
                APIManager.Path.movie_Top +
                "/all/\(limit)/explicit.json"
        }
    }
    
    struct MovieResults {
        var movies: [Movies]
    }
    
    static func topTrendMovies(limit: Int = 50, completion: @escaping APICompletion<MovieResults>) {
        let urlString = QueryString().topMovies(limit: limit)
        
        API.shared().request(urlString: urlString) { (result) in
            switch result {
            case .failure(let error):
                // call back
                completion(.failure(error))
            case .success(let data):
                if let data = data {
                    let json = data.toJSON()
                    let feed = json["feed"] as! JSON
                    let results = feed["results"] as! [JSON]
                    
                    var movies: [Movies] = []
                    for item in results {
                        let movie = Movies(json: item)
                        movies.append(movie)
                    }
                    
                    let movieResults = MovieResults(movies: movies)
                
                    completion(.success(movieResults))
                    
                } else {
                    completion(.failure(.error("Data is not format")))
                }
            }
        }
    }
}

