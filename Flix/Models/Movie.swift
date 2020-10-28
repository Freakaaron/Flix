//
//  Movie.swift
//  Flix
//
//  Created by Arpit Inder Singh on 26/10/20.
//

import Foundation

class Movie {
    var title: String
    var posterPath: URL?
    var imageURL: URL?
    var overview: String
    var releaseDate: String
    let baseUrl = "https://image.tmdb.org/t/p/w185"
    
    init(dict: [String: Any]) {
        title = dict["title"] as! String
        let posterAddress = baseUrl + (dict["poster_path"] as! String)
        let imageAddress = baseUrl + (dict["backdrop_path"] as! String)
        posterPath = URL(string: posterAddress)
        imageURL = URL(string: imageAddress)
        overview = dict["overview"] as! String
        releaseDate = dict["release_date"] as! String
    }
}
