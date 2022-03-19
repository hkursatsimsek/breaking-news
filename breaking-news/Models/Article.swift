//
//  Article.swift
//  breaking-news
//
//  Created by Kürşat Şimşek on 19.03.2022.
//

import Foundation

// MARK: - Article
struct Article: Codable {
    let source: Source
    let author, title: String
    let articleDescription: String?
    let url: String
    let urlToImage: String?
    let publishedAt: Date
    let content: String

    enum CodingKeys: String, CodingKey {
        case source, author, title
        case articleDescription = "description"
        case url, urlToImage, publishedAt, content
    }
}
