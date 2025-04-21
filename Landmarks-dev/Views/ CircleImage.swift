//
//  SwiftUIView.swift
//  Landmarks-dev
//
//  Created by fkk on 2025/4/22.
//

import SwiftUI

struct  CircleImage: View {
    var image:Image
    var body: some View {
        self.image
            .resizable(capInsets: EdgeInsets(top: 0.0, leading: 2.0, bottom: 0.0, trailing: 1.0))
            .clipShape(Circle())
                        .overlay {
                            Circle().stroke(.white, lineWidth: 4)
                        }
                        .shadow(radius: 7)
    }
}

#Preview {
    CircleImage(image: landmarks[0].image)
}
