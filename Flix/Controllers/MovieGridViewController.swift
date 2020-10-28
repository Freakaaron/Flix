//
//  MovieGridViewController.swift
//  Flix
//
//  Created by Arpit Inder Singh on 27/10/20.
//

import UIKit

class MovieGridViewController: UIViewController, UICollectionViewDelegate, UICollectionViewDataSource {
    
    
    @IBOutlet weak var collectionView: UICollectionView!
    var superheroMovies: [Movie] = []

    override func viewDidLoad() {
        super.viewDidLoad()
        
        collectionView.dataSource = self
        collectionView.delegate = self
        
        let layout = collectionView.collectionViewLayout as! UICollectionViewFlowLayout
        
        layout.minimumLineSpacing = 0
        layout.minimumInteritemSpacing = 0
        
        let width = view.frame.size.width / 2
        print(width)
        layout.itemSize = CGSize(width: width, height: width * 3 / 2)
        layout.invalidateLayout()

        // Do any additional setup after loading the view.
        
        getSuperheroMovies()
        
        print(layout.itemSize.width)
    }
    
    func getSuperheroMovies() {
        API.getSuperheroMovies() { (result) in
            guard let result = result else {
                return
            }
            self.superheroMovies = result
            self.collectionView.reloadData()
        }
    }
    

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
    }
    */
    
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return superheroMovies.count
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "MovieGridCell", for: indexPath) as! MovieGridCell
        let superheroMovie = superheroMovies[indexPath.item]
        cell.superheroMovie = superheroMovie
        return cell
    }

}
