import SwiftUI

class TaskViewModel: ObservableObject {
    @Published var tasks: [Task] = [
        Task(title: "Comprar alimentos", details: "Leche, pan, huevos", priority: .high, dueDate: Date(), icon: "star"),
        Task(title: "Revisar correos", details: "Bandeja de entrada personal y trabajo", priority: .medium, dueDate: Date(), icon: "envelope"),
        Task(title: "Hacer ejercicio", details: "30 minutos de cardio", priority: .low, dueDate: Date(), icon: "heart")
    ]

    func addTask(_ task: Task) {
        tasks.append(task)
    }

    func removeTask(at offsets: IndexSet) {
        tasks.remove(atOffsets: offsets)
    }

    func updateTask(task: Task, title: String, details: String, priority: Task.Priority, dueDate: Date, icon: String) {
        if let index = tasks.firstIndex(where: { $0.id == task.id }) {
            tasks[index].title = title
            tasks[index].details = details
            tasks[index].priority = priority
            tasks[index].dueDate = dueDate
            tasks[index].icon = icon
        }
    }
}

