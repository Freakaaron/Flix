//
//  MovieGridCell.swift
//  Flix
//
//  Created by Arpit Inder Singh on 27/10/20.
//

import UIKit
import AlamofireImage

class MovieGridCell: UICollectionViewCell {
    
    @IBOutlet weak var posterView: UIImageView!
    var superheroMovie: Movie! {
        didSet {
            posterView.af.setImage(withURL: superheroMovie.posterPath!)
        }
    }
    
}
