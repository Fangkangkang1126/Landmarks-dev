//
//  SwiftUIView.swift
//  Landmarks-dev
//
//  Created by fkk on 2025/4/22.
//
import SwiftUI


struct LandmarkRow: View {
    var landmark: Landmark


    var body: some View {
        HStack {
            landmark.image
                .resizable()
                .frame(width: 50, height: 50)
            Text(landmark.name)


            Spacer()
            
            if landmark.isFavorite {
                Image (systemName: "star.fill")
                    .foregroundStyle(.yellow)
            }
        }
    }
}


#Preview("预览标签") {
    Group{
        LandmarkRow(landmark: landmarks[0])
        LandmarkRow(landmark: landmarks[1])
    }
}
