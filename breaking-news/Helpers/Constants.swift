//
//  Constants.swift
//  breaking-news
//
//  Created by Kürşat Şimşek on 21.03.2022.
//

import Foundation

//enum Constants: String {
//    case baseURL = "https://newsapi.org/v2"
//    case apiKey = "66d5f974e7244b719cc0f6e17db98bb8"
//
//}

struct Constants {
    static var apiKey: String {
        get {
            guard let filePath = Bundle.main.path(forResource: "NewsAPI", ofType: "plist") else {
                fatalError("Couldn't find file 'NewsAPI.plist'.")
            }
            
            let plist = NSDictionary(contentsOfFile: filePath)
            guard let value = plist?.object(forKey: "API_KEY") as? String else {
                fatalError("Couldn't find key 'API_KEY' in 'TMDB-Info.plist'.")
            }
            
            return value
        }
    }
    
    static var baseURL: String {
        get {
            guard let filePath = Bundle.main.path(forResource: "NewsAPI", ofType: "plist") else {
                fatalError("Couldn't find file 'NewsAPI.plist'.")
            }
            
            let plist = NSDictionary(contentsOfFile: filePath)
            guard let value = plist?.object(forKey: "BASE_URL") as? String else {
                fatalError("Couldn't find key 'BaseURL' in 'TMDB-Info.plist'.")
            }

            return value
        }
    }
}

//private var apiKey: String {
//    get {
//        guard let filePath = Bundle.main.path(forResource: "NewsAPI", ofType: "plist") else {
//            fatalError("Couldn't find file 'NewsAPI.plist'.")
//        }
//
//        let plist = NSDictionary(contentsOfFile: filePath)
//        guard let value = plist?.object(forKey: "API_KEY") as? String else {
//            fatalError("Couldn't find key 'API_KEY' in 'TMDB-Info.plist'.")
//        }
//
//        return value
//    }
//}
