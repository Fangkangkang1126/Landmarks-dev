//
//  Item.swift
//  Landmarks-dev
//
//  Created by fkk on 2025/4/22.
//

import Foundation
import SwiftData

@Model
final class Item {
    var timestamp: Date
    
    init(timestamp: Date) {
        self.timestamp = timestamp
    }
}
