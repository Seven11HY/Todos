//
//  ContentView.swift
//  Todos
//
//  Created by Sven Schmitz on 02.06.24.
//

import SwiftUI
import SwiftData

struct ContentView: View {
    var body: some View {
        TaskList()
    }
}

#Preview {
    ContentView()
        .modelContainer(for: Task.self, inMemory: true)
}
