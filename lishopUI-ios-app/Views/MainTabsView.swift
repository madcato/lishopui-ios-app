//
//  MainTabsView.swift
//  lishopUI-ios-app
//
//  Created by Daniel Vela on 4/9/21.
//

import SwiftUI

struct MainTabsView: View {
    @ObservedObject var store = ArticleStore()

    var body: some View {
        NavigationView {
            TabView() {
                ShoppingListView(store: store)
                    .tabItem {
                        Image(systemName: "square.and.pencil")
                        Text("Shopping list")
                    }
                AddListView(store: store)
                    .tabItem {
                        Image(systemName: "clock.fill")
                        Text("Add")
                    }
            }
        }
    }
}

#if DEBUG
struct MainTabsView_Previews: PreviewProvider {
    static var previews: some View {
        MainTabsView(store: testStore)
    }
}
#endif
