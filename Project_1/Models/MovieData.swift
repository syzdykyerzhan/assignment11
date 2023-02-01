//
//  Database.swift
//  Project_1
//
//  Created by Yerzhan Syzdyk on 31.01.2023.
//

import Foundation

struct MovieData : Decodable{
    var results : [Results]
}

struct Results: Decodable{
    var adult : Bool
    var backdrop_path : String
    var genre_ids : [Int]
    var id : Int
    var original_title : String
    var overview : String
    var poster_path : String
}
