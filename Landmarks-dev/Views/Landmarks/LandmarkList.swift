//
//  LandmarkList.swift
//  Landmarks-dev
//
//  Created by fkk on 2025/4/22.
import SwiftUI


struct LandmarkList: View {
    @Environment(ModelData.self) var modelData
    @State private var showFavoritesOnly = false
    
    var filteredLandmarks: [Landmark] {
        modelData.landmarks.filter { landmark in
                (!showFavoritesOnly || landmark.isFavorite)
            }
        }
    
    var body: some View {
//        List {
//            LandmarkRow(landmark: landmarks[0])
//            LandmarkRow(landmark: landmarks[1])
//            Text("这是测试")
//        }
//        List(landmarks) { lk in
//            LandmarkRow(landmark: lk)
//                .padding(.bottom)
//                .font(.headline)
////                .frame(width: 4, height: 8)
//
//        }
        
        NavigationSplitView {
//                    List(filteredLandmarks) { landmark in
//                        LandmarkRow(landmark: landmark)
//                    }
            List {
                Toggle(isOn: $showFavoritesOnly) {
                                    Text("仅看收藏")
                                }
                ForEach(filteredLandmarks) { landmark in
                    NavigationLink{
                        LandmarkDetail(landmark: landmark)
                    } label:{
                        LandmarkRow(landmark:landmark)
                    }
                }
            }
            .navigationTitle("导航栏")
                } detail: {
                    Text("选择一个地标进行查看详情 ")
                }
    }
}


#Preview {
    LandmarkList()
        .environment(ModelData())
        
}
