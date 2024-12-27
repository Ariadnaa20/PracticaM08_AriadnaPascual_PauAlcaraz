import SwiftUI

struct ContentView: View {
    @StateObject private var viewModel = TaskViewModel()
    @State private var isAddingTask = false

    var body: some View {
        NavigationView {
            VStack {
                List {
                    ForEach(Task.Priority.allCases, id: \.self) { priority in
                        Section(header: Text(priority.rawValue).font(.headline)) {
                            ForEach(viewModel.tasks.filter { $0.priority == priority }) { task in
                                VStack(alignment: .leading) {
                                    Text(task.title)
                                        .font(.headline)
                                    Text(task.details)
                                        .font(.subheadline)
                                        .foregroundColor(.gray)
                                }
                            }
                            .onDelete(perform: viewModel.removeTask)
                        }
                    }
                }
                
                // Aquí está el NavigationLink para el AddTaskView
                NavigationLink(destination: AddTaskView(viewModel: viewModel)) {
                    HStack {
                        Spacer()
                        Text("Add Task")
                            .font(.title3)
                            .foregroundColor(.white)
                        Image(systemName: "plus")
                            .foregroundColor(.white)
                        Spacer()
                    }
                    .padding()
                    .background(Color.blue)
                    .cornerRadius(10)
                    .padding()
                }
            }
            .navigationTitle("Manage Tasks")
        }
    }
}



