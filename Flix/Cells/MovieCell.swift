//
//  MovieCell.swift
//  Flix
//
//  Created by Arpit Inder Singh on 17/10/20.
//

import UIKit

class MovieCell: UITableViewCell {

    @IBOutlet weak var movieImage: UIImageView!
    @IBOutlet weak var movieLabel: UILabel!
    @IBOutlet weak var overviewLabel: UILabel!
    
    var movie: Movie! {
        didSet {
            movieImage.af.setImage(withURL: movie.posterPath!)
            movieLabel.text = movie.title
            overviewLabel.text = movie.overview
        }
    }
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }

}
