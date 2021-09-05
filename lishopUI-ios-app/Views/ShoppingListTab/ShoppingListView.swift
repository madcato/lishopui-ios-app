//
//  ShoppingListView.swift
//  lishopUI-ios-app
//
//  Created by Daniel Vela on 1/9/21.
//

import SwiftUI

struct ShoppingListView: View {
    enum GroupType {
        case category
        case shop
    }
    @EnvironmentObject var store: ArticleStore
    @State var groupedBy: GroupType = .category

    var body: some View {
        NavigationView {
        List {
            Picker(selection: $groupedBy, label: Text("Type")) {
                Text("Category").tag(GroupType.category)
                Text("Shop").tag(GroupType.shop)
            }
            .pickerStyle(SegmentedPickerStyle())
            if groupedBy == .category {
                ForEach(store.categorySections) { categorySection in
                    Section(header: Text(categorySection.category.name)) {
                        ForEach(categorySection.articles) { article in
                            ShoppingListViewCell(article: article)
                                .environmentObject(store)
                        }
                    }
                }
            } else {
                ForEach(store.shopSections) { shopSection in
                    Section(header: Text(shopSection.shop.name)) {
                        ForEach(shopSection.articles) { article in
                            ShoppingListViewCell(article: article)
                                .environmentObject(store)
                        }
                    }
                }
            }
            if store.someArticlesMarked {
                Section(footer: HStack { Spacer()
                    Button("Check out") { store.clearMarkedArticles() }.font(.callout)
                                        Spacer()
                                }) {}
            }
        }
        .navigationBarTitle(Text("Articles"))
        .navigationBarItems(trailing: EditButton())
        .listStyle(GroupedListStyle())
        }

    }


    func move(from source: IndexSet, to destination: Int) {
        store.articles.move(fromOffsets: source, toOffset: destination)
    }
}

#if DEBUG
struct ShoppingListView_Previews: PreviewProvider {
    static var previews: some View {
        ShoppingListView().environmentObject(ArticleStore(articles: testArticleList,
                                                          categories: testCategories,
                                                          containers: testContainers,
                                                          shops: testShops))
    }
}
#endif

struct ShoppingListViewCell: View {
    @EnvironmentObject var store: ArticleStore
    @ObservedObject var article: Article

    var body: some View {
        HStack {
            Image(article.marked ? "marked" : "unmarked")
            VStack(alignment: .leading) {
                Text(article.name)
                    .multilineTextAlignment(.leading)
                    .font(.headline)
                HStack(spacing: 3.0) {
                    Text(String(article.qty))
                        .foregroundColor(.secondary)
                        .multilineTextAlignment(.leading)
                    Text(article.cont.name)
                        .foregroundColor(.secondary)
                        .multilineTextAlignment(.leading)
                    Spacer()
                    Text(article.shop.name)
                        .foregroundColor(.secondary)
                        .multilineTextAlignment(.trailing)
                        .font(.italic(.body)())
                }
            }
        }
        .contentShape(Rectangle())
        .onTapGesture {
            article.marked.toggle()
            store.checkMarked()
        }
    }
}
