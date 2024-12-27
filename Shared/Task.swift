//
//  Task.swift
//  PracticaM08
//
//  Created by Mac Mini on 27/12/24.
//

import SwiftUI

struct Task: Identifiable {
    let id: UUID = UUID()
    var title: String
    var details: String
    var priority: Priority
    var dueDate: Date
    var icon: String  // Nuevo campo para el ícono

    enum Priority: String, CaseIterable {
        case high = "High"
        case medium = "Medium"
        case low = "Low"
    }
    
    enum TaskStatus: String, CaseIterable { // Enum para definir el estado de la tarea
            case pending = "Pending"
            case inProgress = "In Progress"
            case completed = "Completed"
        }
}

