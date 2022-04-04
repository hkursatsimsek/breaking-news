//
//  ViewController.swift
//  breaking-news
//
//  Created by Kürşat Şimşek on 19.03.2022.
//

import UIKit
import Moya

class SearchArticleViewController: UIViewController {
    @IBOutlet weak var articleSearchBar: UISearchBar!
    @IBOutlet weak var articleFromTextField: UITextField!
    @IBOutlet weak var articleToTextField: UILabel!
    @IBOutlet weak var articleShortByTextField: UITextField!
    @IBOutlet weak var articleTableView: UITableView!
    
    let networkManager = NewsNetworkManager()
    var articleList = [Article]()
    var searchText = ""
    var filteredText = ""
    
    override func viewDidLoad() {
        super.viewDidLoad()

        articleTableView.delegate = self
        articleTableView.dataSource = self
        articleSearchBar.delegate = self

        // Register TableViewCell
        /// TableViewCell labels fatal errors
//        self.articleTableView.register(ArticleTableViewCell.self, forCellReuseIdentifier: "articleTableViewCellID")

        let nibArticles = UINib(nibName: "ArticleTableViewCell", bundle: nil)
        articleTableView.register(nibArticles, forCellReuseIdentifier: "articleTableViewCellID")

        fetchArticlesGeneric(searchText: searchText)
//        fetchArticles()
    }

}

// MARK: Methods
extension SearchArticleViewController {
    func fetchArticlesGeneric(searchText: String) {
        networkManager.fetchArticlesGeneric(searchText: searchText) { [weak self] result in
            guard let strongSelf = self else { return }
            switch result {
            case .success(let articleResponse):
                strongSelf.articleList = articleResponse.articles
                strongSelf.articleTableView.reloadData()
//                for article in strongSelf.articleList {
//                    print("\(article.author) - \(article.title) - \(article.source?.name) - \(article.publishedAt)")
//                    print("-------")
//                }
            case .failure(let error):
                print(String(describing: error))
            }
        }
    }
    
    func fetchArticles() {
        networkManager.fetchArticles(searchText: "Google") { articles in
            self.articleList = articles
//            for article in articles {
//                print(article.author)
//            }
        }
    }

}

// MARK: TableView Delegate&DataSource
extension SearchArticleViewController: UITableViewDelegate, UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        articleList.count
    }

    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "articleTableViewCellID", for: indexPath) as! ArticleTableViewCell
        cell.selectionStyle = UITableViewCell.SelectionStyle.none
        let article = self.articleList[indexPath.row]
        cell.setArticle(with : article)
        return cell
    }

    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 180
    }
}

// MARK: SearchBar
extension SearchArticleViewController: UISearchBarDelegate {
    func searchBar(_ searchBar: UISearchBar, textDidChange searchText: String) {
        fetchArticlesGeneric(searchText: searchText)
        articleTableView.reloadData()
    }
}
