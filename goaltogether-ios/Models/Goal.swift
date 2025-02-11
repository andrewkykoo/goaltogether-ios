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
    var description: String?
    
    var createdBy: Member
    
    init(id: UUID, title: String, description: String? = nil, createdBy: Member) {
        self.id = id
        self.title = title
        self.description = description
        self.createdBy = createdBy
    }
}
