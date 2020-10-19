//
//  API.swift
//  Flix
//
//  Created by Arpit Inder Singh on 17/10/20.
//

import Foundation


struct API {
    
    static func getMovies(completion: @escaping ([[String:Any]]?) -> Void) {
        let MOVIE_URL = URL(string: "https://api.themoviedb.org/3/movie/now_playing?api_key=a07e22bc18f5cb106bfe4cc1f83ad8ed")
        let request = URLRequest(url: MOVIE_URL!, cachePolicy: .reloadIgnoringLocalCacheData, timeoutInterval: 10)
        let session = URLSession(configuration: .default, delegate: nil, delegateQueue: OperationQueue.main)
        let task = session.dataTask(with: request) { (data, response, error) in
            if let error = error {
                print(error.localizedDescription)
            } else if let data = data {
                let dataDictionary = try! JSONSerialization.jsonObject(with: data, options: []) as! [String:Any]
                let movies = dataDictionary["results"] as? [[String:Any]] ?? []
                return completion(movies)
            }
        }
        task.resume()
    }
}
