//
//  TaskViewModel.swift
//  PracticaM08
//
//  Created by Mac Mini on 27/12/24.
//

import SwiftUI

class TaskViewModel: ObservableObject {
    @Published var tasks: [Task] = [
        Task(title: "Comprar alimentos", details: "Leche, pan, huevos", priority: .high),
        Task(title: "Revisar correos", details: "Bandeja de entrada personal y trabajo", priority: .medium),
        Task(title: "Hacer ejercicio", details: "30 minutos de cardio", priority: .low)
    ]

    func addTask(_ task: Task) {
        tasks.append(task)
    }

    func removeTask(at offsets: IndexSet) {
        tasks.remove(atOffsets: offsets)
    }

    func updateTask(task: Task, title: String, details: String, priority: Task.Priority) {
        if let index = tasks.firstIndex(where: { $0.id == task.id }) {
            tasks[index].title = title
            tasks[index].details = details
            tasks[index].priority = priority
        }
    }
}

