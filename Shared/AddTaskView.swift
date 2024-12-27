import SwiftUI

struct AddTaskView: View {
    @ObservedObject var viewModel: TaskViewModel
    @State private var title: String = ""
    @State private var details: String = ""
    @State private var selectedPriority: Task.Priority = .medium
    @State private var dueDate: Date = Date() // Fecha predeterminada al momento actual
    @State private var selectedIcon: String = "star" // Ícono predeterminado

    // Lista de íconos disponibles
    let iconOptions = ["star", "heart", "flag", "exclamationmark.triangle", "checkmark"]

    var body: some View {
        NavigationView {
            Form {
                Section(header: Text("Task Information")) {
                    TextField("Title", text: $title)
                    TextField("Description", text: $details)
                    
                    Picker("Priority", selection: $selectedPriority) {
                        ForEach(Task.Priority.allCases, id: \.self) { priority in
                            Text(priority.rawValue).tag(priority)
                        }
                    }

                    DatePicker("Due Date", selection: $dueDate, displayedComponents: .date)
                        .datePickerStyle(GraphicalDatePickerStyle())
                    
                    // Picker para seleccionar el ícono
                    Picker("Icon", selection: $selectedIcon) {
                        ForEach(iconOptions, id: \.self) { icon in
                            HStack {
                                Image(systemName: icon)
                                Text(icon)
                            }.tag(icon)
                        }
                    }
                }

                Button(action: saveTask) {
                    Text("Save Task")
                        .frame(maxWidth: .infinity, alignment: .center)
                }
            }
            .navigationTitle("Add New Task")
        }
    }

    private func saveTask() {
        // Crea la tarea con todos los campos
        let newTask = Task(title: title, details: details, priority: selectedPriority, dueDate: dueDate, icon: selectedIcon)
        viewModel.addTask(newTask) // Agrega la tarea al TaskViewModel
    }
}

