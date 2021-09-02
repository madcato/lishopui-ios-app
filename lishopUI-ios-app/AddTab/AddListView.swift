//
//  AddListView.swift
//  lishopUI-ios-app
//
//  Created by Daniel Vela on 1/9/21.
//

import SwiftUI

struct AddListView: View {
    var articles: [Article] = []

    var body: some View {
        List(articles) { article in
        }
    }
}

#if DEBUG
struct AddListView_Previews: PreviewProvider {
    static var previews: some View {
        AddListView(articles: testArticleList)
    }
}
#endif
