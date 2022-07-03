//
//  MovieManagerDelegateExtension.swift
//  MovieSearcher
//
//  Created by Alexander Khazzam on 7/2/22.
//

import Foundation
import UIKit

extension ViewController: MovieManagerDelegate {
    func didRetrieveMovie(_ movieManager: MovieManager, _ movieData: MovieModel) {
        DispatchQueue.main.async {
            self.logoImageView.image = UIImage(systemName: "appletv")
            self.movieNotFoundLabel.text = ""
            self.loadingIndicator.stopAnimating()
            self.movieModel = movieData
            self.performSegue(withIdentifier: "goToResult", sender: nil)
        }
    }
    
    func movieNotFound(_ movieManagerDelegate: MovieManager, _ error: Error) {
        DispatchQueue.main.async {
            print(error)
            self.movieNotFoundLabel.text = "Movie/Show Not Found!"
            self.loadingIndicator.stopAnimating()
        }
    }
    
    func didFailWithError(_ error: Error) {
        DispatchQueue.main.async {
            print(error)
            self.logoImageView.image = UIImage(systemName: "xmark.icloud")
            self.movieNotFoundLabel.text = ""
            self.loadingIndicator.stopAnimating()
        }
    }
}
