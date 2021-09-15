//
//  Movies.swift
//  MoviesApp
//
//  Created by Nguyễn Trí on 13/08/2021.
//

import Foundation
import UIKit

class Movies {
    var id: String
    var artistName: String
    var releaseDate: String
    var name: String
    var artworkUrl100: String
    var url: String
    var thumbnailImage: UIImage?
    
    init(json: JSON) {
        self.id = json["id"] as! String
        self.artistName = json["artistName"] as! String
        self.releaseDate = json["releaseDate"] as! String
        self.name = json["name"] as! String
        self.artworkUrl100 = json["artworkUrl100"] as! String
        self.url = json["url"] as! String
    }
}

