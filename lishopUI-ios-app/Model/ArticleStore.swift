//
//  ArticleStore.swift
//  lishopUI-ios-app
//
//  Created by Daniel Vela on 2/9/21.
//

import SwiftUI
import Combine

class ArticleStore: ObservableObject {
    @State var articles: [Article]
    @State var categories: [Cate]
    @State var containers: [Cont]
    @State var shops: [Shop]

    init(articles: [Article], categories: [Cate], containers: [Cont], shops: [Shop]) {
        self.articles = articles
        self.categories = categories
        self.containers = containers
        self.shops = shops
    }

    private func initializeCategories(artciles: [Article]) {
        articles.forEach { article in
        let category = article.category
            category.articles.append(article)
        }
    }
}
