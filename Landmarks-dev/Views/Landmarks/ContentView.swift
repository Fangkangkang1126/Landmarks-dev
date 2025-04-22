//
//  ContentView.swift
//  Landmarks-dev
//
//  Created by fkk on 2025/4/22.
//

import SwiftUI
import SwiftData

struct ContentView: View {
    @Environment(\.modelContext) private var modelContext
    @Query private var items: [Item]

    var body: some View {
            LandmarkList()
    }
}

#Preview {
    ContentView()
        .environment(ModelData())
}
