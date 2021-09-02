//
//  Article.swift
//  lishopUI-ios-app
//
//  Created by Daniel Vela on 1/9/21.
//

import Foundation

class Article: Identifiable {
    var id = UUID()
    var name: String = ""
    var category: Cate?
    var cont: Cont?
    var shop: Shop?
    var qty: Int = 0
    var marked: Bool = false

    init(name: String,
         category: Cate? = nil,
         cont: Cont? = nil,
         shop: Shop? = nil,
         marked: Bool = false) {
        self.name = name
        self.category = category
        self.cont = cont
        self.shop = shop
        self.marked = false
    }
}

#if DEBUG
var testCategories = [
    Cate(name: "Fruits"),
    Cate(name: "Food"),
    Cate(name: "Beverages")
]
var testContainers = [
    Cont(name: "package"),
    Cont(name: "bottle")
]
var testShop = [
    Shop(name: "Mercadona"),
    Shop(name: "Lidl")
]
var testArticleList = [
    Article(name: "Apple", category: testCategories[0]),
    Article(name: "Soup", category: testCategories[1], shop: testShop[0]),
    Article(name: "Water", category: testCategories[2], cont: testContainers[1]),
    Article(name: "Salt", category: testCategories[1], cont: testContainers[0], shop: testShop[1], marked: true),
    Article(name: "Orange juice", category: testCategories[2], cont: testContainers[1]),
    Article(name: "Apple es una empresa cojonudísima, del todo y para todo", category: testCategories[0])
]

func initializeCategories() {
    testArticleList.forEach { article in
        let category = article.category
        category?.articles.append(article)
    }
}
#endif
