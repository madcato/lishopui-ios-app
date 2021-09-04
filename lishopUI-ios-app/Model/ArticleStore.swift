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
    @Published var categories: [Cate]
    @Published var containers: [Cont]

    init(articles: [Article] = [], categories: [Cate] = [], containers: [Cont] = []) {
        self.articles = articles
        self.categories = categories
        self.containers = containers
    }

    private func initializeCategories(artciles: [Article]) {
        articles.forEach { article in
            let category = article.category
            category?.articles.append(article)
        }
    }
}
