//
//  Goal.swift
//  goaltogether-ios
//
//  Created by Andrew Koo on 2/11/25.
//

import Foundation

struct Goal: Identifiable, Codable, Equatable {
    let id: UUID
    var title: String
    var description: String
    
    var createdBy: Member
    var members: [Member]  // Members who join or participate in this goal.
    
    init(
        id: UUID,
        title: String,
        description: String,
        createdBy: Member,
        members: [Member] = []  // Default to an empty array.
    ) {
        self.id = id
        self.title = title
        self.description = description
        self.createdBy = createdBy
        self.members = members
    }
}
