//
//  ArticleDetailView.swift
//  lishopUI-ios-app
//
//  Created by Daniel Vela on 4/9/21.
//

import SwiftUI

struct ArticleDetailView: View {
    @ObservedObject var article: Article
    @ObservedObject var store: ArticleStore

    var body: some View {
        NavigationView() {
            Form {
                Section {
                    TextField("Article name", text: $article.name)
                }
                Section {
                    Picker(selection: $article.category, label: Text("Category:")) {
                        ForEach(store.categories) {
                            Text($0.name).tag($0)
                        }
                    }
                }
                Section {
                    Picker(selection: $article.cont, label: Text("Container:")) {
                        ForEach(store.containers) {
                            Text($0.name).tag($0)
                        }
                    }
                }
                Section {
                    Stepper(value: $article.qty) {
                        Text("Quantity:")
                        Text(String(article.qty))
                            .font(.title)
                            .padding(.trailing, 10)
                            .padding(.leading, 10)
                            .background(Color.secondary)
                            .cornerRadius(6.0)
                    }
                }
            }
        }.navigationBarTitle(Text("Article"))
    }
}



#if DEBUG
struct ArticleDetailView_Previews: PreviewProvider {
    static var previews: some View {
        ArticleDetailView(article: testArticleList[0],
                          store: testStore)
    }
}
#endif
