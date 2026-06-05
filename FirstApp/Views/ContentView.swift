//
//  ContentView.swift
//  FirstApp
//
//  Created by George Yao on 6/2/26.
//

import SwiftUI
import SwiftData

struct ContentView: View {
    @Query private var tasks: [Task]
    @Environment(\.modelContext) private var modelContext
    @State private var newTaskTitle = ""
    
    // to dismiss keyboard
    @FocusState private var isTextFieldFocused: Bool
    
    var body: some View {
        VStack {
            
            Text("Task Tracker")
                .font(.largeTitle)
                .fontWeight(.bold)
                .padding(.bottom)
            
            HStack {
                TextField("New Task", text: $newTaskTitle)
                    .textFieldStyle(.roundedBorder)
                    .focused($isTextFieldFocused) // to dismiss keyboard
                Button("Add") {
                    addTask()
                }
                .buttonStyle(.borderedProminent)
                .disabled(newTaskTitle.isEmpty)
            }
            
            // List of Tasks
            List {
                ForEach(tasks) {task in
                    HStack {
                        Text(task.title)
                            .strikethrough(task.isCompleted)
                        Image(systemName: task.isCompleted ? "checkmark.seal.fill" : "circlebadge")
                    }
                    .onTapGesture {
                        toggleTask(task)
                    }
                }
                .onDelete(perform: deleteTask)
            }
        }
        .padding()
        
        .contentShape(Rectangle()) // to dismiss keyboard
                .onTapGesture {
                    isTextFieldFocused = false
                }
    }
    private func addTask() {
        let newTask = Task(title: newTaskTitle)
        modelContext.insert(newTask) // save it to the database
        print("Added task \(newTaskTitle)") // debug output
        newTaskTitle = ""
    }
    private func toggleTask(_ task: Task) {
        task.isCompleted.toggle()
    }
    // deletes the task by swiping left
    private func deleteTask(at offsets: IndexSet) {
        for index in offsets {
            modelContext.delete(tasks[index])
        }
    }
}

#Preview {
    ContentView()
        .modelContainer(for: Task.self, inMemory: true)
}
