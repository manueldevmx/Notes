//
//  Item.swift
//  Notas
//
//  Created by Manuel Hernandez De la Cruz on 06/04/24.
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