//
//  Task.swift
//  Todos
//
//  Created by Sven Schmitz on 02.06.24.
//

import Foundation
import SwiftData

@Model
final class Task {
    var timestamp: Date
    var text: String
    var isDone: Bool
    
    init(timestamp: Date, text: String) {
        self.timestamp = timestamp
        self.text = text
        self.isDone = false
    }
}
