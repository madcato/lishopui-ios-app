//
//  Cont.swift
//  lishopUI-ios-app
//
//  Created by Daniel Vela on 1/9/21.
//

import Foundation

struct Cont: Identifiable, Hashable {
    static func == (lhs: Cont, rhs: Cont) -> Bool {
        lhs.id == rhs.id
    }

    func hash(into hasher: inout Hasher) {
        hasher.combine(id)
    }

    var id = UUID()
    var name: String
}

