//
//  AddTaskInput.swift
//  Todos
//
//  Created by Sven Schmitz on 02.06.24.
//

import SwiftUI

struct AddTaskInput: View {
    @Environment(\.modelContext) private var modelContext
    
    @State private var textInput: String = ""
    
    var body: some View {
        Form {
            HStack {
                TextField("Task hinzufügen", text: $textInput)
                    .submitLabel(.done)
                    .onSubmit { addItem() }
                
                Spacer()
                
                Button {
                    addItem()
                } label: {
                    Image(systemName: "plus")
                        .foregroundStyle(.green)                    
                }
            }
        }
        .frame(height: 46)
        .padding(0)
    }
    
    private func addItem() {
        if textInput != "" {
            withAnimation {
                let newItem = Task(timestamp: Date(), text: textInput)
                modelContext.insert(newItem)
            }
        }
        textInput = ""
    }
}

#Preview {
    AddTaskInput()
}
