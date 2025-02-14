//
//  MockDataService.swift
//  goaltogether-ios
//
//  Created by Andrew Koo on 2/11/25.
//

import Foundation

class MockDataService: DataService {
    
    // MARK: - Goal IDs for Fitness Enthusiasts
    private let marathonGoalId = UUID(uuidString: "11111111-1111-1111-1111-111111111111")!
    private let losePoundsGoalId = UUID(uuidString: "22222222-2222-2222-2222-222222222222")!
    private let cycleGoalId = UUID(uuidString: "33333333-3333-3333-3333-333333333333")!
    
    // MARK: - Goal IDs for Book Club (static for sample preview)
    private let readBooksGoalId = UUID(uuidString: "44444444-4444-4444-4444-444444444444")!
    private let attendAuthorEventGoalId = UUID(uuidString: "55555555-5555-5555-5555-555555555555")!
    
    // MARK: - Goal IDs for Cooking Masters
    private let masterRecipesGoalId = UUID(uuidString: "66666666-6666-6666-6666-666666666666")!
    
    func fetchGroups() async throws -> [Group] {
        // Simulate network delay
        try await Task.sleep(nanoseconds: 1_000_000_000)
        
        // FITNESS ENTHUSIASTS GROUP
        let aliceF = Member(id: UUID(), username: "Alice")
        let bobF = Member(id: UUID(), username: "Bob")
        let charlieF = Member(id: UUID(), username: "Charlie")
        
        let runMarathonGoal = Goal(
            id: marathonGoalId,
            title: "Run a Marathon",
            description: "Train and complete a full marathon.",
            createdBy: aliceF,
            members: [aliceF, charlieF]
        )
        
        let losePoundsGoal = Goal(
            id: losePoundsGoalId,
            title: "Lose 10 Pounds",
            description: "Follow a strict diet and exercise plan.",
            createdBy: bobF,
            members: [bobF]
        )
        
        let cycleGoal = Goal(
            id: cycleGoalId,
            title: "Cycle 100 Miles",
            description: "Participate in a 100-mile cycling event.",
            createdBy: charlieF,
            members: [bobF, charlieF]
        )
        
        let fitnessGroup = Group(
            id: UUID(),
            name: "Fitness Enthusiasts",
            description: "A group for those looking to push their physical limits.",
            interests: ["Running", "Cycling", "Swimming"],
            members: [aliceF, bobF, charlieF],
            goals: [runMarathonGoal, losePoundsGoal, cycleGoal]
        )
        
        // BOOK CLUB GROUP
        let alice = Member(id: UUID(uuidString: "AAAAAAA1-AAAA-AAAA-AAAA-AAAAAAAAAAAA")!, username: "Alice")
        let dave = Member(id: UUID(uuidString: "BBBBBBB1-BBBB-BBBB-BBBB-BBBBBBBBBBBB")!, username: "Dave")
        
        let readBooksGoal = Goal(
            id: readBooksGoalId,
            title: "Read 20 Books",
            description: "Read 20 inspiring books this month.",
            createdBy: alice,
            members: [alice, dave]
        )
        
        let attendAuthorEventGoal = Goal(
            id: attendAuthorEventGoalId,
            title: "Attend Author Event",
            description: "Join a virtual event with a famous author.",
            createdBy: dave,
            members: [alice, dave]
        )
        
        let bookClubGroup = Group(
            id: UUID(),
            name: "Book Club",
            description: "A place for readers to discuss and share insights.",
            interests: ["Fiction", "Self-Improvement"],
            members: [alice, dave],
            goals: [readBooksGoal, attendAuthorEventGoal]
        )
        
        // COOKING MASTERS GROUP
        let emmaC = Member(id: UUID(), username: "Emma")
        let lukeC = Member(id: UUID(), username: "Luke")
        
        let masterRecipesGoal = Goal(
            id: masterRecipesGoalId,
            title: "Master 10 Recipes",
            description: "Learn and perfect 10 new recipes.",
            createdBy: emmaC,
            members: [emmaC, lukeC]
        )
        
        let cookingGroup = Group(
            id: UUID(),
            name: "Cooking Masters",
            description: "For those who enjoy culinary adventures.",
            interests: ["Cooking", "Baking"],
            members: [emmaC, lukeC],
            goals: [masterRecipesGoal]
        )
        
        return [fitnessGroup, bookClubGroup, cookingGroup]
    }
    
    func fetchMilestones() async throws -> [Milestone] {
        try await Task.sleep(nanoseconds: 500_000_000)
        return [
            // Milestones for readBooksGoal (Goal ID: readBooksGoalId)
            Milestone(
                title: "Read Chapter 1",
                isCompleted: true,
                goalId: readBooksGoalId,
                createdBy: Member(id: UUID(uuidString: "AAAAAAA1-AAAA-AAAA-AAAA-AAAAAAAAAAAA")!, username: "Alice")
            ),
            Milestone(
                title: "Discuss Chapter 1",
                isCompleted: true,
                goalId: readBooksGoalId,
                createdBy: Member(id: UUID(uuidString: "BBBBBBB1-BBBB-BBBB-BBBB-BBBBBBBBBBBB")!, username: "Dave")
            ),
            Milestone(
                title: "Read Chapter 2",
                isCompleted: false,
                goalId: readBooksGoalId,
                createdBy: Member(id: UUID(uuidString: "AAAAAAA1-AAAA-AAAA-AAAA-AAAAAAAAAAAA")!, username: "Alice")
            ),
            
            // Milestones for attendAuthorEventGoal (Goal ID: attendAuthorEventGoalId)
            Milestone(
                title: "Prepare questions",
                isCompleted: true,
                goalId: attendAuthorEventGoalId,
                createdBy: Member(id: UUID(uuidString: "BBBBBBB1-BBBB-BBBB-BBBB-BBBBBBBBBBBB")!, username: "Dave")
            ),
            Milestone(
                title: "Attend live event",
                isCompleted: false,
                goalId: attendAuthorEventGoalId,
                createdBy: Member(id: UUID(uuidString: "AAAAAAA1-AAAA-AAAA-AAAA-AAAAAAAAAAAA")!, username: "Alice")
            )
        ]
    }
}
