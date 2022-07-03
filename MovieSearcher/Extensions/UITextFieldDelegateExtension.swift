//
//  UITextFieldDelegateExtension.swift
//  MovieSearcher
//
//  Created by Alexander Khazzam on 7/2/22.
//

import Foundation
import UIKit

extension ViewController: UITextFieldDelegate {
    @IBAction func searchPressed(_ sender: UIButton) {
        movieTextField.endEditing(true)
    }

    func textFieldShouldReturn(_ textField: UITextField) -> Bool {
        textField.endEditing(true)
        return true
    }

    func textFieldShouldEndEditing(_ textField: UITextField) -> Bool {
        return textField.text != "" ? true : false
    }

    func textFieldDidEndEditing(_ textField: UITextField) {
        if let movieTitle = textField.text {
            loadingIndicator.startAnimating()
            movieManager.fetchMovie(movieTitle)
        }
    
        textField.text = ""
    }
}
