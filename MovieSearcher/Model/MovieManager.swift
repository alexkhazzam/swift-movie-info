//
//  MovieManager.swift
//  MovieSearcher
//
//  Created by Alexander Khazzam on 7/2/22.
//

import Foundation

struct MovieManager {
    var delegate: MovieManagerDelegate?
    
    func fetchMovie(_ movieTitle: String) {
        performRequest("https://www.omdbapi.com/?&t=\(movieTitle)&apikey=78628677")
    }
    
    func performRequest(_ requestString: String) {
        // requestString.map({String($0) == " " ? "%20" : String($0)}).joined()
        if let safeURL = URL(string: requestString.replacingOccurrences(of: " ", with: "%20")) {
            let session = URLSession(configuration: .default)
            let task = session.dataTask(with: safeURL) {(data, response, error) in
                if error != nil {
                    delegate?.didFailWithError(error!)
                } else if let safeData = data {
                    if let movieData = parseJSON(safeData) {
                        delegate?.didRetrieveMovie(self, movieData)
                    }
                }
            }
            
            task.resume()
        }
    }
    
    func parseJSON(_ movieData: Data) -> MovieModel? {
        do {
            let decodedData = try JSONDecoder().decode(MovieData.self, from: movieData)

            return MovieModel(
                title: decodedData.Title,
                year: decodedData.Year,
                runtime: decodedData.Runtime,
                genre: decodedData.Genre,
                actors: decodedData.Actors,
                plot: decodedData.Plot,
                awards: decodedData.Awards,
                boxOffice: decodedData.BoxOffice,
                ratings: decodedData.Ratings
            )
        } catch {
            delegate?.movieNotFound(self, error)
            return nil
        }
    }
}
