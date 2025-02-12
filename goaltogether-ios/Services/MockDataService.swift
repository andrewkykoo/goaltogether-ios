//
//  MockDataService.swift
//  goaltogether-ios
//
//  Created by Andrew Koo on 2/11/25.
//

import Foundation

class MockDataService: DataService {
    func fetchGroups() async throws -> [Group] {
        try await Task.sleep(nanoseconds: 1_000_000_000)
        
        return [
            Group(
                id: UUID(),
                name: "Fitness Enthusiasts",
                interests: ["Running", "Cycling", "Weight Loss"],
                members: [
                    Member(id: UUID(), username: "Alice"),
                    Member(id: UUID(), username: "Bob"),
                    Member(id: UUID(), username: "Charlie")
                ],
                goals: [
                    Goal(id: UUID(), title: "Run a Marathon", description: "Train and complete a full marathon", createdBy: Member(id: UUID(), username: "Alice")),
                    Goal(id: UUID(), title: "Lose 10 Pounds", description: "Follow a strict diet and exercise plan", createdBy: Member(id: UUID(), username: "Bob")),
                    Goal(id: UUID(), title: "Cycle 100 Miles", description: "Participate in a 100-mile cycling event", createdBy: Member(id: UUID(), username: "Charlie"))
                ]
            ),
            Group(
                id: UUID(),
                name: "Book Club",
                interests: ["Reading", "Writing", "Discussion"],
                members: [
                    Member(id: UUID(), username: "David"),
                    Member(id: UUID(), username: "Eva"),
                    Member(id: UUID(), username: "Frank")
                ],
                goals: [
                    Goal(id: UUID(), title: "Read 20 Books", description: "Read 20 different books this year", createdBy: Member(id: UUID(), username: "David")),
                    Goal(id: UUID(), title: "Write Book Reviews", description: "Write reviews for each book read", createdBy: Member(id: UUID(), username: "Eva")),
                    Goal(id: UUID(), title: "Host Monthly Meetings", description: "Organize and host monthly book discussions", createdBy: Member(id: UUID(), username: "Frank"))
                ]
            ),
            Group(
                id: UUID(),
                name: "Cooking Masters",
                interests: ["Cooking", "Baking", "Food Blogging"],
                members: [
                    Member(id: UUID(), username: "Mike"),
                    Member(id: UUID(), username: "Nina"),
                    Member(id: UUID(), username: "Oliver")
                ],
                goals: [
                    Goal(id: UUID(), title: "Master 50 Recipes", description: "Learn and perfect 50 different recipes", createdBy: Member(id: UUID(), username: "Mike")),
                    Goal(id: UUID(), title: "Host Dinner Parties", description: "Host dinner parties for friends and family", createdBy: Member(id: UUID(), username: "Nina")),
                    Goal(id: UUID(), title: "Start a Food Blog", description: "Create and maintain a food blog", createdBy: Member(id: UUID(), username: "Oliver"))
                ]
            )
        ]
    }
}
