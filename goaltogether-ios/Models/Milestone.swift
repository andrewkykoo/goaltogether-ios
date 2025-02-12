//
//  Milestone.swift
//  goaltogether-ios
//
//  Created by Andrew Koo on 2/11/25.
//

import Foundation

struct Milestone: Identifiable, Codable, Equatable {
    let id: UUID
    var title: String
    var description: String?
    var isCompleted: Bool
    var dueDate: Date?
    
    var goalId: UUID
    
    var createdBy: Member
    
    init(
        id: UUID = UUID(),
        title: String,
        description: String? = nil,
        isCompleted: Bool = false,
        dueDate: Date? = nil,
        goalId: UUID,
        createdBy: Member
    ) {
        self.id = id
        self.title = title
        self.description = description
        self.isCompleted = isCompleted
        self.dueDate = dueDate
        self.goalId = goalId
        self.createdBy = createdBy
    }
}
