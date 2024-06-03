//
//  TaskList.swift
//  Todos
//
//  Created by Sven Schmitz on 02.06.24.
//

import SwiftUI
import SwiftData

extension AnyTransition {
    static var moveAndFade: AnyTransition {
        .asymmetric(
            insertion: .move(edge: .trailing).combined(with: .opacity),
            removal: .scale.combined(with: .opacity)
        )
    }
}

struct TaskList: View {
    @Environment(\.modelContext) private var modelContext
    @Query private var tasks: [Task]
    
    private let sortTasks = { (task1: Task, task2: Task) -> Bool in
        return task2.timestamp < task1.timestamp
    }
    
    var body: some View {
        let sortedTasks : [Task] = tasks .sorted(by: self.sortTasks)
        
        return NavigationSplitView {
            VStack{
                AddTaskInput()
                withAnimation {
                    List {
                        Section ("Offen") {
                            ForEach(sortedTasks .filter { !$0.isDone } ) { task in
                                TaskItem(task: task)
                                    .transition(.moveAndFade)
                                
                            }
//                            .onDelete(perform: deleteTasks )
                        }
                        
                        Section ("Erledigte Tasks") {
                            
                            ForEach(sortedTasks .filter { $0.isDone }) { task in
                                TaskItem(task: task)
                                    .foregroundStyle(.gray)
                                    .strikethrough()
                            }
//                            .onDelete(perform: deleteTasks)
                        }
                    }
                    
                }
            }
//            .toolbar {
//                ToolbarItem(placement: .navigationBarTrailing) {
//                    EditButton()
//                }
//            }
            .navigationTitle("ToDos")
        } detail: {
            Text("Select an item")
        }
    }
    
    private func addItem() {
        withAnimation {
            let newItem = Task(timestamp: Date(), text: "New Task")
            modelContext.insert(newItem)
        }
    }
    
    private func deleteTasks(offsets: IndexSet) {
        withAnimation() {
            for index in offsets {
                modelContext.delete(tasks[index])
            }
        }
    }
}

#Preview {
    TaskList()
        .modelContainer(for: Task.self, inMemory: true)
}
