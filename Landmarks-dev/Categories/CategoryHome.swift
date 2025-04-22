//
//  CategoryHome.swift
//  Landmarks-dev
//
//  Created by fkk on 2025/4/22.
//

import SwiftUI

struct CategoryHome: View {
    @Environment(ModelData.self) var modelData
    @State private var showingProfile = false
    var body: some View {
        NavigationSplitView {
            List {
//                NavigationLink {
//                    LandmarkDetail(landmark: modelData.features[0])
//                } label: {
//                    VStack {
//                        modelData.features[0].image
//                            .resizable()
//                            .scaledToFill()
//                            .frame(height: 200)
//                            .clipped()
//                            .cornerRadius(15)
//                        Divider()
//                            .background(Color.gray)  // 可自定义颜色
//                            .padding(.vertical, 8)  // 控制上下间距
//                        Text(modelData.features[0].name)
//                            .foregroundStyle(.primary)
                        //                            .font(.caption)
                        //                            .bold()
//                    }
//                }

                //                modelData.features[0].image
                //                    .resizable()
                //                    .scaledToFill()
                //                    .frame(height: 200)
                //                    .clipped()
                //                    .cornerRadius(15)
                //                Text(modelData.features[0].name).bold()
        PageView (pages: modelData.features.map {
            FeatureCard (landmark: $0)})
                ForEach(modelData.categories.keys.sorted(), id: \.self) { key in
                    //                               Text(key)
                    CategoryRow(
                        categoryName: key,
                        items: modelData.categories[key]!
                    )
                }
                .listRowInsets(EdgeInsets())
            }
            .listStyle(.inset)
            .navigationTitle("分类")
            .toolbar {
                Button {
                    showingProfile.toggle()
                } label: {
                    Label("用户简介： ", systemImage: "person.crop.circle")
                }
            }
            .sheet(isPresented: $showingProfile) {
                ProfileHost()
                    .environment(modelData)
            }
        } detail: {
            Text("Select a Landmark")
        }
    }
}

#Preview {
    CategoryHome()
        .environment(ModelData())
}
