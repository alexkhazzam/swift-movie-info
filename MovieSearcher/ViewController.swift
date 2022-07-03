//
//  ViewController.swift
//  MovieSearcher
//
//  Created by Alexander Khazzam on 7/2/22.
//

import UIKit

class ViewController: UIViewController {

    @IBOutlet weak var movieTextField: UITextField!
    @IBOutlet weak var logoImageView: UIImageView!
    @IBOutlet weak var movieNotFoundLabel: UILabel!
    @IBOutlet weak var loadingIndicator: UIActivityIndicatorView!
    
    var movieManager = MovieManager()
    var movieModel: MovieModel?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        movieManager.delegate = self
        movieTextField.delegate = self
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if segue.identifier == "goToResult" {
            let resultVC = segue.destination as! ResultViewController
            if let safeMovieModel = movieModel {
                resultVC.movieModel = safeMovieModel
            }
        }
    }

}

