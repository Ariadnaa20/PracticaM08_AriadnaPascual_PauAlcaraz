import SwiftUI

struct EditTaskView: View {
    @ObservedObject var viewModel: TaskViewModel
    @State var task: Task

    var body: some View {
        NavigationView {
            Form {
                Section(header: Text("Task Information")) {
                    TextField("Title", text: $task.title)
                    TextField("Description", text: $task.details)
                    
                    Picker("Priority", selection: $task.priority) {
                        ForEach(Task.Priority.allCases, id: \.self) { priority in
                            Text(priority.rawValue).tag(priority)
                        }
                    }

                    DatePicker("Due Date", selection: $task.dueDate, displayedComponents: .date)
                        .datePickerStyle(GraphicalDatePickerStyle())
                }

                Button(action: saveTask) {
                    Text("Save Changes")
                        .frame(maxWidth: .infinity, alignment: .center)
                }
            }
            .navigationTitle("Edit Task")
        }
    }

    private func saveTask() {
        // Actualiza la tarea con los campos modificados
        viewModel.updateTask(task: task, title: task.title, details: task.details, priority: task.priority, dueDate: task.dueDate, icon: task.icon)
    }
}

