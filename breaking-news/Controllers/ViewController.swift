//
//  ViewController.swift
//  breaking-news
//
//  Created by Kürşat Şimşek on 19.03.2022.
//

import UIKit
import Moya

class ViewController: UIViewController {
    
    let networkManager = NewsNetworkManager()
    var articleList = [Article]()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        networkManager.fetchArticles(searchText: "Google") { articles in
            
            self.articleList = articles
            
            for article in articles {
                print(article.author)
            }
        }
    }

}

