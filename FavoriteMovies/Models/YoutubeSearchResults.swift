//
//  YoutubeSearchResults.swift
//  FavoriteMovies
//
//  Created by Oğuzhan Can on 16.10.2022.
//

import Foundation

struct YoutubeSearchResponse : Codable{
    let items : [VideoElement]
}

struct VideoElement : Codable{
    let id : IDViedeElement
}

struct IDViedeElement : Codable{
    let kind : String
    let videoId : String
}
