//
//  NewsAPI.swift
//  breaking-news
//
//  Created by Kürşat Şimşek on 19.03.2022.
//

import Foundation
import Moya

enum NewsAPI {
    case everything(_ searchText: String)
    case topHeadlines
    case sources
}

extension NewsAPI: TargetType {
    var baseURL: URL {
        guard let url = URL(string: Constants.baseURL) else { fatalError("baseURL could not be configured.")}
        return url
    }
    
    var path: String {
        switch self {
        case .everything:
            return "/everything"
        case .topHeadlines:
            return "/top-headlines"
        case .sources:
            return "/top-headlines/sources"
        }
    }

    var method: Moya.Method {
        return .get
    }

    var sampleData: Data {
        return Data()
    }

    var headers: [String : String]? {
        return ["Content-Type": "application/json",
                "X-Api-Key":Constants.apiKey]
    }

    var task: Task {
        let encoding = URLEncoding.queryString
        switch self {
        case .everything(let searchText):
            return .requestParameters(
                parameters: [
                    "q" : searchText
                ],
                encoding: encoding)
        case .topHeadlines: // TODO
            return .requestParameters(
                parameters: [
                    "":""
                ],
                encoding: encoding)
        case .sources: // TODO
            return .requestParameters(
                parameters: [
                    "":""
                ],
                encoding: encoding)
        }
    }
}
