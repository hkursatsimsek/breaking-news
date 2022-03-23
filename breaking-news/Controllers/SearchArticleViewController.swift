//
//  ViewController.swift
//  breaking-news
//
//  Created by Kürşat Şimşek on 19.03.2022.
//

import UIKit
import Moya

class SearchArticleViewController: UIViewController {
    
    let networkManager = NewsNetworkManager()
    var articleList = [Article]()
    
    override func viewDidLoad() {
        super.viewDidLoad()

        fetchArticlesGeneric()
//        fetchArticles()
    }

}

// MARK: Methods
extension SearchArticleViewController {
    func fetchArticlesGeneric() {
        networkManager.fetchArticlesGeneric(searchText: "Intel") { [weak self] result in
            guard let strongSelf = self else { return }
            switch result {
            case .success(let articleResponse):
                strongSelf.articleList = articleResponse.articles
                for article in strongSelf.articleList {
                    print("\(article.author) - \(article.title)")
                }
            case .failure(let error):
                print(String(describing: error))
            }
        }
    }
    
    func fetchArticles() {
        networkManager.fetchArticles(searchText: "Google") { articles in
            
            self.articleList = articles
            
            for article in articles {
                print(article.author)
            }
        }
    }

}

