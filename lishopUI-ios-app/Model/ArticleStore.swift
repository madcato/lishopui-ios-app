//
//  ArticleStore.swift
//  lishopUI-ios-app
//
//  Created by Daniel Vela on 2/9/21.
//

import CoreData
import OSLog

final class ArticlePrivader {
    static let shared = ArticlePrivader()
    
    // MARK: Logging

    let logger = Logger(subsystem: "com.example.apple-samplecode.Earthquakes", category: "persistence")
    
    // MARK: Core Data
    
    private let inMemory: Bool
    private var notificationToken: NSObjectProtocol?

    private init(inMemory: Bool = false) {
        self.inMemory = inMemory

        // Observe Core Data remote change notifications on the queue where the changes were made.
        notificationToken = NotificationCenter.default.addObserver(forName: .NSPersistentStoreRemoteChange, object: nil, queue: nil) { note in
            self.logger.debug("Received a persistent store remote change notification.")
            Task {
                await self.fetchPersistentHistory()
            }
        }
    }
    
    /// A quakes provider for use with canvas previews.
    static let preview: ArticlePrivader = {
        let provider = ArticlePrivader(inMemory: true)
        Quake.makePreviews(count: 10)
        return provider
    }()

    /// A persistent container to set up the Core Data stack.
    lazy var container: NSPersistentContainer = {
        /// - Tag: persistentContainer
        let container = NSPersistentContainer(name: "Earthquakes")

        guard let description = container.persistentStoreDescriptions.first else {
            fatalError("Failed to retrieve a persistent store description.")
        }

        if inMemory {
            description.url = URL(fileURLWithPath: "/dev/null")
        }

        // Enable persistent store remote change notifications
        /// - Tag: persistentStoreRemoteChange
        description.setOption(true as NSNumber,
                              forKey: NSPersistentStoreRemoteChangeNotificationPostOptionKey)

        // Enable persistent history tracking
        /// - Tag: persistentHistoryTracking
        description.setOption(true as NSNumber,
                              forKey: NSPersistentHistoryTrackingKey)

        container.loadPersistentStores { storeDescription, error in
            if let error = error as NSError? {
                fatalError("Unresolved error \(error), \(error.userInfo)")
            }
        }

        // This sample refreshes UI by consuming store changes via persistent history tracking.
        /// - Tag: viewContextMergeParentChanges
        container.viewContext.automaticallyMergesChangesFromParent = false
        container.viewContext.name = "viewContext"
        /// - Tag: viewContextMergePolicy
        container.viewContext.mergePolicy = NSMergeByPropertyObjectTrumpMergePolicy
        container.viewContext.undoManager = nil
        container.viewContext.shouldDeleteInaccessibleFaults = true
        return container
    }()

}






//import Combine
//
//struct CategorySection: Identifiable, Hashable {
//    static func == (lhs: CategorySection, rhs: CategorySection) -> Bool {
//        lhs.category == rhs.category
//    }
//
//    func hash(into hasher: inout Hasher) {
//        hasher.combine(id)
//    }
//
//    var id = UUID()
//    var category: Cate
//    var articles: [Article]
//}
//
//struct ShopSection: Identifiable, Hashable {
//    static func == (lhs: ShopSection, rhs: ShopSection) -> Bool {
//        lhs.shop == rhs.shop
//    }
//
//    func hash(into hasher: inout Hasher) {
//        hasher.combine(id)
//    }
//
//    var id = UUID()
//    var shop: Shop
//    var articles: [Article]
//}
//
//class ArticleStore: ObservableObject {
//    @State var articles: [Article]
//    @State var categories: [Cate]
//    @State var containers: [Cont]
//    @State var shops: [Shop]
//    @Published var someArticlesMarked: Bool = true
//    var categorySections: [CategorySection]  /// Each section holds its associated articles
//    var shopSections: [ShopSection]  /// Each section holds its associated articles
//
//
//    init(articles: [Article], categories: [Cate], containers: [Cont], shops: [Shop]) {
//        self.articles = articles
//        self.categories = categories
//        self.containers = containers
//        self.shops = shops
//        self.categorySections = []
//        self.shopSections = []
//
//        sortArticles()
//
//        prepareCategorySections()
//        prepareShopsSections()
//    }
//
//    func clearMarkedArticles() {
//        articles.forEach { article in
//            if article.marked == true{
//                article.qty = 0
//                article.marked.toggle()
//            }
//        }
//        checkMarked()
//    }
//
//    // TODO: Mejor subscribirse a los cambios de los articulos, y chequear automaticamente el estado.
//    func checkMarked() {
//        someArticlesMarked = articles.allSatisfy { $0.marked == false}
//        someArticlesMarked.toggle()
//    }
//
//    private func sortArticles() {
//        self.articles = self.articles.sorted { article1, article2 in
//            article1.name.uppercased() > article2.name.uppercased()
//        }
//    }
//
//    private func prepareCategorySections() {
//        articles.forEach { article in
//            if let foundIndex = categorySections.firstIndex(where: { $0.category == article.category }) {
//                self.categorySections[foundIndex].articles.append(article)
//            } else {
//                /// If doesn't exists yet, create it
//                self.categorySections.append(CategorySection(category: article.category, articles: [article]))
//            }
//        }
//    }
//
//    private func prepareShopsSections() {
//        articles.forEach { article in
//            if let foundIndex = shopSections.firstIndex(where: { $0.shop == article.shop }) {
//                self.shopSections[foundIndex].articles.append(article)
//            } else {
//                /// If doesn't exists yet, create it
//                self.shopSections.append(ShopSection(shop: article.shop, articles: [article]))
//            }
//        }
//    }
//}
