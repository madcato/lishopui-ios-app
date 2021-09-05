//
//  Article.swift
//  lishopUI-ios-app
//
//  Created by Daniel Vela on 1/9/21.
//

import SwiftUI

class Article: Identifiable, ObservableObject {
    var id = UUID()
    @Published var name: String
    @Published var category: Cate = Cate(name: "")
    @Published var cont: Cont = Cont(name: "")
    @Published var shop: Shop = Shop(name: "")
    @Published var qty: Int = 0
    @Published var marked: Bool = false

    init() {
        name = ""
    }

    init(name: String,
         category: Cate? = nil,
         cont: Cont? = nil,
         shop: Shop? = nil,
         marked: Bool = false) {
        self.name = name
        if let category = category {
            self.category = category
        }
        if let cont = cont {
            self.cont = cont
        }
        if let shop = shop {
            self.shop = shop
        }
        self.marked = false
    }

    func increment() {
        qty += 1
    }

    func decrement() {
        qty -= 1
        qty = qty < 0 ? 0 : qty
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
    Article(name: "Apple", category: testCategories[0]),
    Article(name: "Soup", category: testCategories[1], shop: testShops[0]),
    Article(name: "Water", category: testCategories[2], cont: testContainers[1]),
    Article(name: "Salt", category: testCategories[1], cont: testContainers[0], shop: testShops[1], marked: true),
    Article(name: "Orange juice", category: testCategories[2], cont: testContainers[1]),
    Article(name: "Apple es una empresa cojonudísima, del todo y para todo", category: testCategories[0])
]
var testStore = ArticleStore(articles: testArticleList, categories: testCategories, containers: testContainers, shops: testShops)
#endif
