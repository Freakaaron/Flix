//
//  MovieDetailViewController.swift
//  Flix
//
//  Created by Arpit Inder Singh on 26/10/20.
//

import UIKit

class MovieDetailsViewController: UIViewController {

    
    @IBOutlet weak var backdropImage: UIImageView! {
        didSet {
            backdropImage.af.setImage(withURL: movied.imageURL!)
        }
    }
    @IBOutlet weak var posterImage: UIImageView! {
        didSet {
            posterImage.af.setImage(withURL: movied.posterPath!)
        }
    }
    @IBOutlet weak var movieTitle: UILabel! {
        didSet {
            movieTitle.text = movied.title
        }
    }
    @IBOutlet weak var movieOverview: UILabel! {
        didSet {
            movieOverview.text = movied.overview
        }
    }
    var movied: Movie!
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
        
    }
    

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
    }
    */

}
