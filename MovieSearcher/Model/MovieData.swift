//
//  MovieData.swift
//  MovieSearcher
//
//  Created by Alexander Khazzam on 7/2/22.
//

import Foundation

struct MovieData: Codable {
    let Title: String
    let Year: String
    let Runtime: String
    let Genre: String
    let Actors: String
    let Plot: String
    let Awards: String
    let BoxOffice: String
    let Ratings: [Rating]
}

struct Rating: Codable {
    let Source: String
    let Value: String
}

