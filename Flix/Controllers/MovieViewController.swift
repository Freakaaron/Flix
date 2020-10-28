//
//  ViewController.swift
//  Flix
//
//  Created by Arpit Inder Singh on 17/10/20.
//

import UIKit
import AlamofireImage


class MovieViewController: UIViewController, UITableViewDelegate, UITableViewDataSource {

    @IBOutlet weak var moviesView: UITableView!
    var movies: [Movie] = []
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        
        
        getMovies()
        
        moviesView.delegate = self
        moviesView.dataSource = self
        
    }
    
    func getMovies() {
        API.getMovies() { (result) in
            guard let result = result else {
                return
            }
            self.movies = result
            self.moviesView.reloadData()
        }
    }


}


extension MovieViewController {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return self.movies.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "MovieCell") as! MovieCell
        let movie = self.movies[indexPath.row]
        
        /*
        cell.movieLabel.text = movie["title"] as? String ?? ""
        cell.overviewLabel.text = movie["overview"] as? String ?? ""
        
        
        let baseUrl = "https://image.tmdb.org/t/p/w185"
        if let posterPath = movie["poster_path"] as? String {
            let imageUrl = URL(string: baseUrl + posterPath)
            cell.movieImage.af.setImage(withURL: imageUrl!)
        }
        */
        cell.movie = movie
        
        return cell
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        
        // Find the selected movie
        let cell = sender as! UITableViewCell
        let indexPath = moviesView.indexPath(for: cell)!
        let movie = movies[indexPath.row]
       
        
        // Pass the selected movie to the Movie Details View Controller
        let detailsViewController = segue.destination as! MovieDetailsViewController
        detailsViewController.movied = movie
        
        moviesView.deselectRow(at: indexPath, animated: true)
    }
}

