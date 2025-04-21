//
//  SwiftUIView.swift
//  Landmarks-dev
//
//  Created by fkk on 2025/4/22.
//

import SwiftUI

struct  CircleImage: View {
    var body: some View {
        Image("Pic-test")
            .resizable(capInsets: EdgeInsets(top: 1.0, leading: 2.0, bottom: 0.0, trailing: 0.0))
            .clipShape(Circle())
                        .overlay {
                            Circle().stroke(.white, lineWidth: 4)
                        }
                        .shadow(radius: 8)
    }
}

#Preview {
    CircleImage()
}
