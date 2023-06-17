//
//  MainTabsView.swift
//  lishopUI-ios-app
//
//  Created by Daniel Vela on 4/9/21.
//

import CoreData
import SwiftUI

struct MainTabsView: View {
    @Environment
    @StateObject var store: ArticleStore

    var body: some View {
        NavigationView {
            TabView() {
                ShoppingListView().environment(\.managedObjectContext, container.viewContext)
                    .tabItem {
                        Image(systemName: "square.and.pencil")
                        Text("Shopping list")
                    }
                AddListView()
                    .tabItem {
                        Image(systemName: "clock.fill")
                        Text("Add")
                    }
            }
            .environmentObject(store)
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
