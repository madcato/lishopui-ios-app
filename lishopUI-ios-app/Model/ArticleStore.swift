//
//  ArticleStore.swift
//  lishopUI-ios-app
//
//  Created by Daniel Vela on 2/9/21.
//

import SwiftUI
import Combine

class ArticleStore: ObservableObject {
    @Published var articles: [Article]

    init(articles: [Article] = []) {
        self.articles = articles
        
    }

    private func initializeCategories(artciles: [Article]) {
        articles.forEach { article in
            let category = article.category
            category?.articles.append(article)
        }
    }
}
