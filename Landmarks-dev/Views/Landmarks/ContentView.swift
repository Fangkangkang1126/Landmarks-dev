//
//  ContentView.swift
//  Landmarks-dev
//
//  Created by fkk on 2025/4/22.
//

//import SwiftData
import SwiftUI

struct ContentView: View {
    @State private var selection: Tab = .featured
    //    @Environment(\.modelContext) private var modelContext
    //    @Query private var items: [Item]

    enum Tab {
        case featured
        case list
    }

    var body: some View {
        TabView(selection: $selection) {
            CategoryHome()
                .tabItem {
                    Label("个人收藏", systemImage: "star")
                }
                .tag(Tab.featured)

            LandmarkList()
                .tabItem {
                    Label("列表视图", systemImage: "list.bullet")
                }
                .tag(Tab.list)
        }
    }
}

#Preview {
    ContentView()
        .environment(ModelData())
}
