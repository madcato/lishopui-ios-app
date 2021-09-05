//
//  ShoppingListView.swift
//  lishopUI-ios-app
//
//  Created by Daniel Vela on 1/9/21.
//

import SwiftUI

struct ShoppingListView: View {
    @EnvironmentObject var store: ArticleStore

    var body: some View {
        NavigationView {
        List() {
            Picker(selection: .constant(1), label: Text("Type")) {
                Text("Category").tag(1)
                Text("Shop").tag(2)
            }
            .pickerStyle(SegmentedPickerStyle())
            // Mirar de hacer un groupedByCategory(articles)
            ForEach(store.articles) { article in
//                Section(header: Text(category.name)) {
//                    ForEach(category.articles) { article in
//                        ShoppingListViewCell(article: article)
//                    }
//                }
                ShoppingListViewCell(article: article)
            }
        }
        .navigationBarTitle(Text("Articles"))
        .navigationBarItems(trailing: EditButton())
        .listStyle(GroupedListStyle())

        if true {
            Text("PRICE")
        }
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
        .onTapGesture { article.marked.toggle() }
    }
}
