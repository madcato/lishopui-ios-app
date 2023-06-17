//
//  Article.swift
//  lishopUI-ios-app
//
//  Created by Daniel Vela on 21/4/23.
//

import CoreData
import SwiftUI
import OSLog

// MARK: - Core Data

/// Managed object subclass for the Article entity.
class Article: NSManagedObject {

    // The characteristics of a article.
    @NSManaged var checked: Bool
    @NSManaged var firstLettes: String
    @NSManaged var name: String
    @NSManaged var prize: Double
    @NSManaged var qty: Int
    @NSManaged var category: Cate?
    @NSManaged var shop: Shop?
    @NSManaged var container: Cont?

}

// MARK: - SwiftUI

extension Article {
    
    /// An earthquake for use with canvas previews.
    static var preview: Article {
        let article = Article.makePreviews(count: 1)
        return article[0]
    }

    @discardableResult
    static func makePreviews(count: Int) -> [Article] {
        var articles = [Article]()
        let viewContext = ArticleProvider.preview.container.viewContext
        for index in 0..<count {
            let article = Article(context: viewContext)
            article.code = UUID().uuidString
            article.time = Date().addingTimeInterval(Double(index) * -300)
            article.magnitude = .random(in: -1.1...10.0)
            article.place = "15km SSW of Cupertino, CA"
            articles.append(quake)
        }
        return articles
    }
}

#if DEBUG
var testCategories = [
    Cate(name: ""),
    Cate(name: "Fruits"),
    Cate(name: "Food"),
    Cate(name: "Beverages")
]
var testContainers = [
    Cont(name: ""),
    Cont(name: "package"),
    Cont(name: "bottle")
]
var testShops = [
    Shop(name: ""),
    Shop(name: "Mercadona"),
    Shop(name: "Lidl")
]
var testArticleList = [
    Article(name: "Apple", category: testCategories[1], cont: testContainers[0], shop: testShops[1], marked: true),
    Article(name: "Soup", category: testCategories[0], cont: testContainers[1], shop: testShops[1], marked: true),
    Article(name: "Water", category: testCategories[3], cont: testContainers[2], shop: testShops[1], marked: true),
    Article(name: "Cigars", category: testCategories[2], cont: testContainers[0], shop: testShops[0], marked: true),
    Article(name: "Salt", category: testCategories[2], cont: testContainers[2], shop: testShops[0], marked: true),
    Article(name: "Orange juice", category: testCategories[1], cont: testContainers[1], shop: testShops[2], marked: true),
    Article(name: "Coffer", category: testCategories[1], cont: testContainers[0], shop: testShops[2], marked: true)
]
var testStore = ArticleStore(articles: testArticleList, categories: testCategories, containers: testContainers, shops: testShops)
#endif
