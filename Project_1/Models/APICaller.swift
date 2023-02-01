//
//  APICaller.swift
//  Project_1
//
//  Created by Yerzhan Syzdyk on 30.01.2023.
//

import Foundation

protocol APICallerDelegate{
    func didUpdateMovieList(with movieList: [MovieModel])
    func didFailWithError(_ error : Error)
}

struct APICaller{
    
    var delegate: APICallerDelegate?
    
    func fetchRequest(){
        let api_key = "e0f9078e2a80c046997e4bd61c827765"
        
        let url_string : String = "\(Constants.Resources.popular)\(api_key)"
        
        guard let url = URL(string: url_string) else { fatalError("Incorrect link!")}
        let task = URLSession.shared.dataTask(with: url){ data, _ , error in
            if let data, error == nil {
                if let movieList = parseJSON(data){
                    delegate?.didUpdateMovieList(with: movieList)
                }else{delegate?.didFailWithError(error!)}
            }else{
                delegate?.didFailWithError(error!)
            }
        }
        
        task.resume()
    }
    func parseJSON(_ data : Data) -> [MovieModel]?{
        var movieList: [MovieModel] = []
        do{
            let decodeData = try JSONDecoder().decode(MovieData.self, from: data)
            for movie in decodeData.results{
                movieList.append(MovieModel(adult: movie.adult, backdropPath: movie.backdrop_path, genreIds: movie.genre_ids, id: movie.id, originalTitle: movie.original_title, overview: movie.overview, posterPath: movie.poster_path))
                //print(movie.original_title)
            }
            
        }catch{
            print(error)
            return nil
        }
        
        //print(movieList)
        return movieList
    }
}
