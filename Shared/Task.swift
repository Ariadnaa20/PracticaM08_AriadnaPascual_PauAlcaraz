//
//  Task.swift
//  PracticaM08
//
//  Created by Mac Mini on 27/12/24.
//

import Foundation

struct Task: Identifiable {
    let id: UUID = UUID()
    var title: String
    var details: String
    var priority: Priority

    enum Priority: String, CaseIterable {
        case high = "High"
        case medium = "Medium"
        case low = "Low"
    }
}
