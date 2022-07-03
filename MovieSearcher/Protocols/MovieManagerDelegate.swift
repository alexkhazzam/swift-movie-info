//
//  Delegates.swift
//  MovieSearcher
//
//  Created by Alexander Khazzam on 7/2/22.
//

import Foundation

protocol MovieManagerDelegate {
    func didRetrieveMovie(_ movieManager: MovieManager, _ movieData: MovieModel)
    func movieNotFound()
    func didFailWithError(_ error: Error)
}
