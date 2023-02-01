//
//  MovieModel.swift
//  Project_1
//
//  Created by Yerzhan Syzdyk on 31.01.2023.
//

import Foundation

struct MovieModel: Decodable{
    var adult : Bool
    var backdropPath : String
    var genreIds : [Int]
    var id : Int
    var originalTitle : String
    var overview : String
    var posterPath : String
}
