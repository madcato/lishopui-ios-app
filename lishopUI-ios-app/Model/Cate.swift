//
//  Cate.swift
//  lishopUI-ios-app
//
//  Created by Daniel Vela on 1/9/21.
//

import Foundation

class Cate: Identifiable {
    var id = UUID()
    var name: String = ""
    var articles: [Article] = []

    init(name: String) {
        self.name = name
    }
}
