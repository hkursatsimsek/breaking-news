//
//  ArticleTableViewCell.swift
//  breaking-news
//
//  Created by Kürşat Şimşek on 23.03.2022.
//

import UIKit

class ArticleTableViewCell: UITableViewCell {
    @IBOutlet weak var artImageView: UIImageView!
    @IBOutlet weak var artTitleLabel: UILabel!
    @IBOutlet weak var artAuthorLabel: UILabel!
    @IBOutlet weak var artPublishedLabel: UILabel!
    @IBOutlet weak var artSourceLabel: UILabel!

    func setArticle(with article : Article) {
        if let title = article.title, let author = article.author, let published = article.publishedAt, let source = article.source?.name {
//            print("\(title) * \(author) * \(published) * \(source)")
            artTitleLabel.text = "\(title)"
            artAuthorLabel.text = author
            artPublishedLabel.text = published
            artSourceLabel.text = source
//            artImageView.image = UIImage()
        }
    }
}
