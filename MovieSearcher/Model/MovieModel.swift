//
//  MovieModel.swift
//  MovieSearcher
//
//  Created by Alexander Khazzam on 7/2/22.
//

import Foundation

struct MovieModel {
    let title: String
    let year: String
    let runtime: String
    let genre: String
    let actors: String
    let plot: String
    let awards: String
    let boxOffice: String
    let ratings: [Rating]
    

    var ratingsString: String {
        return """
        \(ratings[0].Source): \(ratings[0].Value)
        \(ratings[1].Source): \(ratings[1].Value)
        \(ratings[2].Source): \(ratings[2].Value)
        """
    }
}
