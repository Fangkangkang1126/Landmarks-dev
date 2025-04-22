//
//  LandmarkDetail.swift
//  Landmarks-dev
//
//  Created by fkk on 2025/4/22.
//

import SwiftUI

struct LandmarkDetail: View {
    @Environment(ModelData.self) var modelData
    var landmark: Landmark

    var landmarkIndex: Int {
        modelData.landmarks.firstIndex(where: {
            $0.id == landmark.id
        })!

    }

    var body: some View {
        //绑定数据模型
        @Bindable var modelData = modelData
        ScrollView {
            MapView(coordinate: landmark.locationCoordinate)
                .frame(height: 300)

            CircleImage(image: landmark.image)
                .offset(y: -130)
                .padding(.bottom, -130)

            VStack(alignment: .leading) {
                HStack{
                    Text(landmark.name)
                        .font(.title)
                    FavoriteButton(isSet: $modelData.landmarks[landmarkIndex].isFavorite)
                }


                HStack {
                    Text(landmark.park)
                    Spacer()
                    Text(landmark.state)
                }
                .font(.subheadline)
                .foregroundStyle(.secondary)

                Divider()

                Text("About \(landmark.name)")
                    .font(.title2)
                Text("Descriptive :\(landmark.description).")
            }
            .padding()

            //            Spacer()
        }
    }
}

#Preview {
    let modelData = ModelData()
    LandmarkDetail(landmark: modelData.landmarks[0])
        .environment(modelData)
}
