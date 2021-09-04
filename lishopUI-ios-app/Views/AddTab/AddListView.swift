//
//  AddListView.swift
//  lishopUI-ios-app
//
//  Created by Daniel Vela on 1/9/21.
//

import SwiftUI

struct AddListView: View {
    @ObservedObject var store = ArticleStore()

    var body: some View {
        NavigationView {
            List() {

                // Mirar de hacer un groupedByCategory(articles)
                ForEach(store.articles) { article in
    //                Section(header: Text(category.name)) {
    //                    ForEach(category.articles) { article in
    //                        ShoppingListViewCell(article: article)
    //                    }
    //                }
                    NavigationLink(destination: ArticleDetailView(article: article, store: store)) {
                        AddListViewCell(article: article)
                    }
                }
                .onDelete(perform: delete)
            }
            .navigationBarTitle(Text("Prepare list"))
            .navigationBarItems(leading:  Button(action: addArticle) {
                Text("Filter")
                    .font(.title2)
            }, trailing: Button(action: addArticle) {
                Text("+")
                    .font(.title)
            })
            .listStyle(GroupedListStyle())
        }
    }

    func addArticle() {
        store.articles.append(Article(name: "Pepe"))
    }

    func delete(at offsets: IndexSet) {
        store.articles.remove(atOffsets: offsets)
    }
}

#if DEBUG
struct AddListView_Previews: PreviewProvider {
    static var previews: some View {
        AddListView(store: ArticleStore(articles: testArticleList))
    }
}
#endif

struct AddListViewCell: View {
    let article: Article
    @State private var marked = false

    var body: some View {
        HStack {
            VStack(alignment: .leading) {
                Text(article.category?.name ?? "")
                    .multilineTextAlignment(.leading)
                    .font(.caption)
                    .foregroundColor(.secondary)
                    .padding(.bottom, 1)
                Text(article.name)
                    .multilineTextAlignment(.leading)
                    .font(.title2)
                HStack(spacing: 3.0) {
                    Text("quantity:")
                        .font(.caption2)
                        .foregroundColor(.secondary)
                        .padding(.leading, 10)
                        .padding(.trailing, 10)
                    Text(String(article.qty))
                        .multilineTextAlignment(.leading)
                        .font(.title2)
                        .padding(.trailing, 10)
                    Text(article.cont?.name ?? "")
                        .foregroundColor(.secondary)
                        .multilineTextAlignment(.leading)
                        .font(.caption2)
                    Spacer()
                    Stepper(
                        onIncrement: { article.increment() },
                        onDecrement: { article.decrement() },
                        label: { })
                        .padding(.trailing, 20)
                }
            }
        }.onTapGesture { marked.toggle() }
    }
}
