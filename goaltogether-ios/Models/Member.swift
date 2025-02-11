//
//  Member.swift
//  goaltogether-ios
//
//  Created by Andrew Koo on 2/11/25.
//

import Foundation

struct Member: Identifiable, Codable, Equatable {
    let id: UUID
    var username: String
    
    init(id: UUID = UUID(), username: String) {
        self.id = id
        self.username = username
    }
}
