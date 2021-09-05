//
//  Shop.swift
//  lishopUI-ios-app
//
//  Created by Daniel Vela on 1/9/21.
//

import Foundation

class Shop: Identifiable, Hashable, ObservableObject {
    static func == (lhs: Shop, rhs: Shop) -> Bool {
        lhs.id == rhs.id
    }

    func hash(into hasher: inout Hasher) {
        hasher.combine(id)
    }

    var id = UUID()
    var name: String = ""

    init(name: String) {
        self.name = name
    }
}
