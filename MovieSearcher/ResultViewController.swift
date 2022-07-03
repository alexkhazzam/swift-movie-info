//
//  ResultViewController.swift
//  MovieSearcher
//
//  Created by Alexander Khazzam on 7/2/22.
//

import UIKit

class ResultViewController: UIViewController {

    @IBOutlet weak var titleLabel: UILabel!
    @IBOutlet weak var yearLabel: UILabel!
    @IBOutlet weak var runtimeLabel: UILabel!
    @IBOutlet weak var genreLabel: UILabel!
    @IBOutlet weak var actorsLabel: UILabel!
    @IBOutlet weak var awardsLabel: UILabel!
    @IBOutlet weak var boxOfficeLabel: UILabel!
    @IBOutlet weak var ratingsLabel: UILabel!
    // @IBOutlet weak var plotLabel: UILabel!
    
    var movieModel: MovieModel?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        titleLabel.text = movieModel!.title
        yearLabel.text = "Year: " + movieModel!.year
        runtimeLabel.text = "Runtime: " + movieModel!.runtime
        genreLabel.text = "Genre: " + movieModel!.genre
        actorsLabel.text = "Actors: " + movieModel!.actors
        awardsLabel.text = "Awards: " + movieModel!.awards
        boxOfficeLabel.text = "Box Office: " + movieModel!.boxOffice
        ratingsLabel.text = "Rating(s): " + movieModel!.ratingsString
        // plotLabel.text = "Plot: " + movieModel!.plot
    }
    
    @IBAction func backArrowPressed(_ sender: Any) {
        self.dismiss(animated: true, completion: nil)
    }
}
