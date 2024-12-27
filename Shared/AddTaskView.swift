//
//  AddTaskView.swift
//  PracticaM08
//
//  Created by Mac Mini on 27/12/24.
//

import SwiftUI

struct AddTaskView: View {
    @Environment(\.presentationMode) var presentationMode
    @ObservedObject var viewModel: TaskViewModel
    @State private var title: String = ""
    @State private var details: String = ""
    @State private var priority: Task.Priority = .medium

    var body: some View {
        Form {
            Section(header: Text("Title")) {
                TextField("Enter title", text: $title)
            }

            Section(header: Text("Details")) {
                TextField("Enter details", text: $details)
            }

            Section(header: Text("Priority")) {
                Picker("Priority", selection: $priority) {
                    ForEach(Task.Priority.allCases, id: \.rawValue) { priority in
                        Text(priority.rawValue).tag(priority)
                    }
                }
                .pickerStyle(SegmentedPickerStyle())
            }
        }
        .navigationTitle("Add Task")
        .toolbar {
            ToolbarItem(placement: .cancellationAction) {
                Button("Cancel") {
                    presentationMode.wrappedValue.dismiss()
                }
            }
            ToolbarItem(placement: .primaryAction) {
                Button("Save") {
                    let newTask = Task(title: title, details: details, priority: priority)
                    viewModel.addTask(newTask)
                    presentationMode.wrappedValue.dismiss()
                }
            }
        }
    }
}
