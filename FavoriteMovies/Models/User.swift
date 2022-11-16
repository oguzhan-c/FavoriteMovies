//
//  People.swift
//  FavoriteMovies
//
//  Created by Oğuzhan Can on 4.11.2022.
//

import Foundation
import RealmSwift

class User : Object{
    @Persisted(primaryKey: true) var _id : ObjectId
    @Persisted var firstName : String
    @Persisted var lastName : String
    @Persisted var email : String = ""
    @Persisted var password : String = ""
}
