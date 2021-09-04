//
//  Cate.swift
//  lishopUI-ios-app
//
//  Created by Daniel Vela on 1/9/21.
//

import Foundation

class Cate: Identifiable, Hashable {
    static func == (lhs: Cate, rhs: Cate) -> Bool {
        lhs.id == rhs.id
    }

    func hash(into hasher: inout Hasher) {
        hasher.combine(id)
    }

    var id = UUID()
    var name: String = ""
    var articles: [Article] = []

    init(name: String) {
        self.name = name
    }
}
