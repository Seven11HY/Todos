//
//  TaskItem.swift
//  Todos
//
//  Created by Sven Schmitz on 02.06.24.
//

import SwiftUI

struct TaskItem: View {
    @Environment(\.modelContext) private var modelContext
    var task: Task
    
    var body: some View {
        HStack {
        Text(task.text)
            Spacer()
            Button {
                task.isDone.toggle()
            } label: {
                Image(systemName: task.isDone ? "checkmark.circle.fill":"circle")
                    .foregroundColor(task.isDone ? .green : .primary)
            }
        }
    }
}

#Preview {
    TaskItem(
        task: Task(
            timestamp: Date(), text: "Neuer Task"
        )
    )
}
