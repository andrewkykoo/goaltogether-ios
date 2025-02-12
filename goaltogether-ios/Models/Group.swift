//
//  Group.swift
//  goaltogether-ios
//
//  Created by Andrew Koo on 2/11/25.
//

import Foundation

struct Group: Identifiable, Codable, Equatable {
    let id: UUID
    var name: String
    var interests: [String]
    
    var members: [Member]
    
    var goals: [Goal]
    
    init(id: UUID, name: String, interests: [String], members: [Member], goals: [Goal]) {
        self.id = id
        self.name = name
        self.interests = interests
        self.members = members
        self.goals = goals
    }
}
