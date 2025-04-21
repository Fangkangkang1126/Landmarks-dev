//
//  LandmarkList.swift
//  Landmarks-dev
//
//  Created by fkk on 2025/4/22.
import SwiftUI


struct LandmarkList: View {
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
                    List(landmarks) { landmark in
                        LandmarkRow(landmark: landmark)
                    }
                } detail: {
                    Text("Select a Landmark")
                }
    }
}


#Preview {
    LandmarkList()
}
