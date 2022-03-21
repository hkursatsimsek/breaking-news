//
//  NewsNetworkManager.swift
//  breaking-news
//
//  Created by Kürşat Şimşek on 19.03.2022.
//

import Foundation
import Moya
import SwiftyJSON

protocol Networkable {
    var provider: MoyaProvider<NewsAPI> { get }

    func fetchArticles(searchText: String, completion: @escaping ([Article]) -> ())
}

struct NewsNetworkManager: Networkable {
    var provider = MoyaProvider<NewsAPI>(plugins: [NetworkLoggerPlugin()])

    func fetchArticles(searchText: String, completion: @escaping ([Article]) -> ()) {
        provider.request(.everything(searchText)) { result in
            switch result {
            case .success(let response):
                do {
                    let result = try JSONDecoder().decode(ArticleResponse.self, from: response.data)
                    completion(result.articles)
                } catch let error {
                    print(String(describing: error))
                }
            case .failure(let error):
                print(error.localizedDescription)
            }
        }
    }

}


