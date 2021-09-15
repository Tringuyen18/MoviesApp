//
//  TrendViewModel.swift
//  MoviesApp
//
//  Created by Nguyễn Trí on 13/08/2021.
//

import Foundation


class TrendViewModel {
    
    var movies: [Movies] = []
    
    func loadAPI(completion: @escaping Completion) {
        let urlString = "https://rss.itunes.apple.com/api/v1/us/movies/top-movies/all/50/explicit.json"
        Networking.shared().request(with: urlString) { (data, error) in
                if let error = error {
                    completion(false, error.localziedDescription)
                } else {
                    if let data = data {
                        let json = data.toJSON()
                        let feed = json["feed"] as! JSON
                        let results = feed["results"] as! [JSON]
                        
                        for item in results {
                            let movie = Movies(json: item)
                            self.movies.append(movie)

                            // call back
                            completion(true, "")
                        }
                    } else {
                        // call back
                        completion(false, "Data format is error.")
                    }
            }
        }
    }
}
