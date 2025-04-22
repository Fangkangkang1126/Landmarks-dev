//
//  Landmark.swift
//  Landmarks-dev
//
//  Created by fkk on 2025/4/22.
//

import CoreLocation
import Foundation
import SwiftUI

struct Landmark: Hashable, Codable, Identifiable {
    var id: Int
    var name: String
    var park: String
    var state: String
    var description: String
    var isFavorite: Bool
    var isFeatured: Bool

    private var imageName: String
    var image: Image {
        Image(imageName)

    }
    var category: Category
    enum Category: String, CaseIterable, Codable {
        case lakes = "Lakes"
        case rivers = "Rivers"
        case mountains = "Mountains"
    }

    private var coordinates: Coordinates
    var locationCoordinate: CLLocationCoordinate2D {
        CLLocationCoordinate2D(
            latitude: coordinates.latitude,
            longitude: coordinates.longitude
        )
    }
    var featureImageOffice: Image? {
        isFeatured ? Image(imageName + "_feature") : nil
    }
    var featureImage: Image? {
        isFeatured ? Image(imageName) : nil
    }

    struct Coordinates: Hashable, Codable {
        var latitude: Double
        var longitude: Double
    }
}
