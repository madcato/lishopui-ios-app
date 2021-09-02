//
//  ShoppingListView.swift
//  lishopUI-ios-app
//
//  Created by Daniel Vela on 1/9/21.
//

import SwiftUI

struct ShoppingListView: View {
    @ObservedObject var store = ArticleStore()

    var body: some View {
        NavigationView {
        List() {
            Button(action: addArticle) {
                Text("Add article")
            }

            Picker(selection: .constant(1), label: Text("Type")) {
                Text("Category").tag(1)
                Text("Shop").tag(2)
            }
            .pickerStyle(SegmentedPickerStyle())
            // Mirar de hacer un groupedByCateogry(articles)
            ForEach(store.articles) { article in
//                Section(header: Text(category.name)) {
//                    ForEach(category.articles) { article in
//                        ShoppingListViewCell(article: article)
//                    }
//                }
                ShoppingListViewCell(article: article)
            }
            .onDelete(perform: delete)
            .onMove(perform: move)
        }
        .navigationBarTitle(Text("Articles"))
        .navigationBarItems(trailing: EditButton())
        .listStyle(GroupedListStyle())

        if true {
            Text("PRICE")
        }
        }
    }

    func addArticle() {
        store.articles.append(Article(name: "Pepe"))
    }

    func delete(at offsets: IndexSet) {
        store.articles.remove(atOffsets: offsets)
    }

    func move(from source: IndexSet, to destination: Int) {
        store.articles.move(fromOffsets: source, toOffset: destination)
    }
}

#if DEBUG
struct ShoppingListView_Previews: PreviewProvider {
    static var previews: some View {
        ShoppingListView(store: ArticleStore(articles: testArticleList))
    }
}
#endif

struct ShoppingListViewCell: View {
    let article: Article
    @State private var marked = false

    var body: some View {
        HStack {
            Image(marked ? "marked" : "unmarked")
            VStack(alignment: .leading) {
                Text(article.name)
                    .multilineTextAlignment(.leading)
                HStack(spacing: 3.0) {
                    Text(String(article.qty))
                        .foregroundColor(.secondary)
                        .multilineTextAlignment(.leading)
                    Text(article.cont?.name ?? "")
                        .foregroundColor(.secondary)
                        .multilineTextAlignment(.leading)
                    Spacer()
                    Text(article.shop?.name ?? "")
                        .foregroundColor(.secondary)
                        .multilineTextAlignment(.trailing)
                }
            }
        }.onTapGesture { marked.toggle() }
    }
}
