//
//  Room.swift
//  lishopUI-ios-app
//
//  Created by Daniel Vela on 31/8/21.
//

import SwiftUI

struct Room: Identifiable {
    var id = UUID()
    var name: String
}

#if DEBUG
let testData = [
    Room(name: "Hola"),
    Room(name: "Salón"),
    Room(name: "Dormitorio")
]
#endif


