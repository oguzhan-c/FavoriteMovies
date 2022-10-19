//
//  Tiitle-Realm.swift
//  FavoriteMovies
//
//  Created by Oğuzhan Can on 16.10.2022.
//

import Foundation

struct TitleResponse : Codable{
    let results : [Title]
}

struct Title : Codable {
    let id : Int
    let original_title : String?
    let original_name : String?
    let name : String?
    let poster_path : String?
    let media_type : String?
    let vote_average : Double
    let overview : String?
    let title : String?
}
