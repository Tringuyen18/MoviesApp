//
//  API.Manager.swift
//  MoviesApp
//
//  Created by Nguyễn Trí on 13/08/2021.
//

import Foundation

struct APIManager {
    
    // Config
    struct Path {

        static let base_Domain = "https://rss.itunes.apple.com"
        static let base_Path = "/api/v1/us"
        
        static let movie_Path = "/movies"
        static let movie_Top = "/top-movies"
    }
    
    // Domain
    struct Movies {}
    
}
