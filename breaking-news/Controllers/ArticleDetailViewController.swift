//
//  ArticleDetailViewController.swift
//  breaking-news
//
//  Created by Kürşat Şimşek on 4.04.2022.
//

import UIKit

class ArticleDetailViewController: UIViewController {
    @IBOutlet weak var detailImageView: UIImageView!
    @IBOutlet weak var detailTitleLabel: UILabel!
    @IBOutlet weak var detailDescriptionLabel: UILabel!
    @IBOutlet weak var detailAuthorLabel: UILabel!
    @IBOutlet weak var detailPublishedLabel: UILabel!

    @IBOutlet weak var imageHeightContraint: NSLayoutConstraint!
    @IBOutlet weak var imageWidthContraint: NSLayoutConstraint!

    var articleDetail: Article?
    let downloadImageClass = DownloadImage()

    override func viewDidLoad() {
        super.viewDidLoad()

        setAttr()
    }

    func setAttr() {
        guard let articleDetail = articleDetail else { return }
        if let title = articleDetail.title, let description = articleDetail.articleDescription, let author = articleDetail.author, let published = articleDetail.publishedAt, let imageURL = articleDetail.urlToImage {
            detailTitleLabel.text = title
            detailDescriptionLabel.text = description
            detailAuthorLabel.text = author
            detailPublishedLabel.text = published
            downloadImageClass.downloadImage(urlString: imageURL, imageView: detailImageView)
        }
    }

    func setUI() {
        let screenSize: CGRect = UIScreen.main.bounds
        // TODO: Resim boyutu dinam
        //        let ratio =
        
    }

}

extension UIScreen{
    static let screenWidth = UIScreen.main.bounds.size.width
    static let screenHeight = UIScreen.main.bounds.size.height
    static let screenSize = UIScreen.main.bounds.size
}
