//
//  News.swift
//  breaking-news
//
//  Created by Kürşat Şimşek on 19.03.2022.
//

import Foundation

// MARK: - ArticleResponse
struct ArticleResponse: Codable {
    let status: String
    let totalResults: Int
    let articles: [Article]
}
