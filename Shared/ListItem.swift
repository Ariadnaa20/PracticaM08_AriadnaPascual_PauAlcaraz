//
//  ListItem.swift
//  PracticaM08
//
//  Created by Mac Mini on 27/12/24.
//

struct ListItem: View {
    var task: Task
    
    var body: some View {
        HStack {
            Image(systemName: task.icon)
            VStack(alignment: .leading) {
                Text(task.title).font(.headline)
                Text(task.details).font(.subheadline)
                    .foregroundColor(.gray)
                Text(task.status.rawValue) // Mostrar el estado de la tarea
                    .font(.subheadline)
                    .foregroundColor(task.status == .completed ? .green : .red)
            }
        }
    }
}
