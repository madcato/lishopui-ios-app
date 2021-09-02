//
//  ContentView.swift
//  lishopUI-ios-app
//
//  Created by Daniel Vela on 31/8/21.
//

import SwiftUI

struct ContentView: View {
    var rooms: [Room] = []
    @State var flag = false
    var body: some View {
        NavigationView {
            Mainview(rooms: rooms)

        }

    }
}

struct MainTabBar: View {

    var body: some View {
        TabView {
            ContentView(rooms: testData).tabItem { Text("Tab Label 1") }.tag(1)
            Text("Tab Content 2").tabItem { Text("Tab Label 2") }.tag(2)
        }
    }
}

#if DEBUG
struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView(rooms: testData)
//        MainTabBar()
    }
}
#endif

struct Mainview: View {
    var rooms: [Room] = []
    var body: some View {
        List(rooms) { room in
            HStack {
                //            Image("photo").resizable().aspectRatio(contentMode: .fit)
                VStack {
                    Text("Hello, world!").padding().cornerRadius(/*@START_MENU_TOKEN@*/3.0/*@END_MENU_TOKEN@*/).foregroundColor(/*@START_MENU_TOKEN@*/.blue/*@END_MENU_TOKEN@*/)
                    Text(room.name)
                        .bold()
                        .padding()
                        .font(.subheadline)
                        .foregroundColor(.secondary)
                }
            }
        }.navigationBarTitle(Text("Rooms"))
    }
}
