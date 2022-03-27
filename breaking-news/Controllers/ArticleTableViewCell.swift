//
//  ArticleTableViewCell.swift
//  breaking-news
//
//  Created by Kürşat Şimşek on 23.03.2022.
//

import UIKit

class ArticleTableViewCell: UITableViewCell {
    @IBOutlet weak var articleImageView: UIImageView!
    @IBOutlet weak var articleTitleLabel: UILabel!
    @IBOutlet weak var articleAuthorLabel: UILabel!
    @IBOutlet weak var articlePublishedLabel: UILabel!
    @IBOutlet weak var articleSourceLabel: UILabel!

    override func awakeFromNib() {
        super.awakeFromNib()
    }

    func setArticle(with article : Article) {
        if let title = article.title, let author = article.author, let published = article.publishedAt, let source = article.source.name {
            print("\(title) * \(author) * \(published) * \(source)")
            articleTitleLabel.text = title
            articleAuthorLabel.text = author
            articlePublishedLabel.text = published
            articleSourceLabel.text = source
//            articleImageView.image = UIImage()
        }
    }
}
