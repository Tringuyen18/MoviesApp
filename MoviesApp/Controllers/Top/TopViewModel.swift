//
//  TopViewModel.swift
//  TopViewModel
//
//  Created by Nguyễn Trí on 13/09/2021.
//

import Foundation

class TopViewModel {
    
    var movies: [Movies] = []
    
    func loadAPITop(completion: @escaping Completion) {
        APIManager.Movies.topTrendMovies { (result) in
            switch result {
            case .failure(let error):
                completion(false, error.localziedDescription)
            case .success(let movieResults):
                self.movies.append(contentsOf: movieResults.movies)
                completion(true, "")
            }
        }
    }
}



