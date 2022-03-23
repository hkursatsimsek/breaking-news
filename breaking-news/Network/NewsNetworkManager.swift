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
    func fetchArticlesGeneric(searchText:String,completion: @escaping (Result<ArticleResponse, Error>) -> ())
}

struct NewsNetworkManager: Networkable {
    var provider = MoyaProvider<NewsAPI>(plugins: [NetworkLoggerPlugin()])
    
    func fetchArticlesGeneric(searchText:String, completion: @escaping (Result<ArticleResponse, Error>) -> ()) {
        request(target: .everything(searchText), completion: completion)
    }

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

private extension NewsNetworkManager {
    private func request<T: Decodable>(target: NewsAPI, completion: @escaping (Result<T, Error>) -> ()) {
        provider.request(target) { result in
            switch result {
            case let .success(response):
                do {
                    let results = try JSONDecoder().decode(T.self, from: response.data)
                    completion(.success(results))
                } catch let error {
                    completion(.failure(error))
                }
            case let .failure(error):
                completion(.failure(error))
            }
        }
    }
}


