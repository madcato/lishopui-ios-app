//
//  ShoppingListView.swift
//  lishopUI-ios-app
//
//  Created by Daniel Vela on 1/9/21.
//

import SwiftUI

struct ShoppingListView: View {
    var categories: [Cate] = []

    var body: some View {
        List() {

            Picker(selection: .constant(1), label: Text("Type")) {
                Text("Category").tag(1)
                Text("Shop").tag(2)
            }
            .pickerStyle(SegmentedPickerStyle())
            // Mirar de hacer un groupedByCateogry(articles)
            ForEach(categories) { category in
                Section(header: Text(category.name)) {
                    ForEach(category.articles) { article in
                        ShoppingListViewCell(article: article)
                    }
                }
            }
        }
        .listStyle(GroupedListStyle())
    }
}

#if DEBUG
struct ShoppingListView_Previews: PreviewProvider {
    static var previews: some View {
        ShoppingListView(categories: testCategories)
    }
}
#endif

struct ShoppingListViewCell: View {
    let article: Article

    var body: some View {
        HStack {
            Image(article.marked ? "marked" : "unmarked")
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
        }
    }
}
