//
//  APIHelper.swift
//  FavoriteMovies
//
//  Created by Oğuzhan Can on 15.10.2022.
//

import Foundation

enum APIError : Error{
    case failedToGetData
}

class APIHelper{
    static let shared = APIHelper()
    
    func getTrendingMovies(completion : @escaping (Result<[Title], Error>) -> Void) {
        guard let url = URL(string: "\(Constants.baseURL)/3/trending/movie/day?api_key=\(Constants.keyTMDB)")else{return}
        let task = URLSession.shared.dataTask(with: URLRequest(url: url)) { data, _, error in
            guard let data = data , error == nil else{
                return
            }
            do{
                let results = try JSONDecoder().decode(TitleResponse.self, from: data)
                completion(.success(results.results))
            }
            catch{
                completion(.failure(APIError.failedToGetData))
            }
        }
        
        task.resume()
    }
    
    func getTrendingTv(completion : @escaping (Result<[Title], Error>) -> Void) {
        guard let url = URL(string: "\(Constants.baseURL)/3/trending/tv/day?api_key=\(Constants.keyTMDB)")else{return}
        let task = URLSession.shared.dataTask(with: URLRequest(url: url)) { data, _, error in
            guard let data = data , error == nil else{
                return
            }
            do{
                let results = try JSONDecoder().decode(TitleResponse.self, from: data)
                completion(.success(results.results))
    
            }
            catch{
                completion(.failure(APIError.failedToGetData))
            }
        }
        task.resume()
    }
    
    func getUpcomingMovies(completion : @escaping (Result<[Title],Error>) -> Void) {
        guard let url = URL(string: "\(Constants.baseURL)/3/movie/upcoming?api_key=\(Constants.keyTMDB)") else {return}
        let task = URLSession.shared.dataTask(with: URLRequest(url: url)) { data, _, error in
            guard let data = data , error == nil else{
                return
            }
            
            do{
                let results = try JSONDecoder().decode(TitleResponse.self, from: data)
                completion(.success(results.results))
            }
            catch{
                completion(.failure(APIError.failedToGetData))
            }
        }
        
        task.resume()
        
    }
    
    func getTopRateds(completion : @escaping (Result<[Title],Error>) -> Void){
        guard let url = URL(string:  "\(Constants.baseURL)/3/movie/top_rated?api_key=\(Constants.keyTMDB)")
        else{return}
        let task = URLSession.shared.dataTask(with: url) { data, _, error in
            guard let data = data , error == nil else{return}
            do{
                let results = try JSONDecoder().decode(TitleResponse.self, from: data)
                completion(.success(results.results))
            }
            catch{
                completion(.failure(APIError.failedToGetData))
            }
        }
        task.resume()
    }
    
    func getPopular(completion : @escaping (Result<[Title] , Error>) -> Void){
        guard let url = URL(string: "\(Constants.baseURL)/3/movie/popular?api_key=\(Constants.keyTMDB)")
        else{return}
        
        let task = URLSession.shared.dataTask(with: url) { data , _, error in
            guard let data = data , error == nil else{return}
            
            do{
                let results = try JSONDecoder().decode(TitleResponse.self, from: data)
                completion(.success(results.results))
            }
            catch{
                completion(.failure(APIError.failedToGetData))
            }
        }
        task.resume()
    }
    
    func getDiscoverMovies(completion : @escaping (Result<[Title] , Error>) -> Void){
        guard let url = URL(string: "\(Constants.baseURL)/3/discover/movie?api_key=\(Constants.keyTMDB)")
        else{return}
        
        let task = URLSession.shared.dataTask(with: url) { data , _, error in
            guard let data = data , error == nil else{return}
            
            do{
                let results = try JSONDecoder().decode(TitleResponse.self, from: data)
                completion(.success(results.results))
            }
            catch{
                completion(.failure(APIError.failedToGetData))
            }
        }
        task.resume()
    }
    func getSearch(with query : String , completion : @escaping (Result<[Title] , Error>) -> Void){
        
        guard let query = query.addingPercentEncoding(withAllowedCharacters: .urlHostAllowed)else{return}
        
        guard let url = URL(string: "\(Constants.baseURL)/3/search/movie?api_key=\(Constants.keyTMDB)&query=\(query)") else{return}
        
        let task = URLSession.shared.dataTask(with: url) { data , _, error in
            guard let data = data , error == nil else{return}
            
            do{
                let results = try JSONDecoder().decode(TitleResponse.self, from: data)
                completion(.success(results.results))
            }
            catch{
                completion(.failure(APIError.failedToGetData))
            }
        }
        task.resume()
    }
     
    func getYoutubeVideo(with query: String, completion: @escaping (Result<VideoElement, Error>) -> Void) {
          guard let query = query.addingPercentEncoding(withAllowedCharacters: .urlHostAllowed) else {return}
          guard let url = URL(string: "\(Constants.youtubeBaseURL)q=\(query)&key=\(Constants.keyYoutube)") else {return}
          let task = URLSession.shared.dataTask(with: URLRequest(url: url)) { data, _, error in
              guard let data = data, error == nil else {
                  return
              }
              
              do {
                  let results = try JSONDecoder().decode(YoutubeSearchResponse.self, from: data)
                  
                  completion(.success(results.items[0]))
              } catch {
                  completion(.failure(error))
                  print(error.localizedDescription)
              }

          }
          task.resume()
      }
}
