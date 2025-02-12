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
    
    // MARK: - Goal IDs for Book Club
    private let readBooksGoalId = UUID(uuidString: "44444444-4444-4444-4444-444444444444")!
    private let writeReviewsGoalId = UUID(uuidString: "55555555-5555-5555-5555-555555555555")!
    private let hostMeetingsGoalId = UUID(uuidString: "66666666-6666-6666-6666-666666666666")!
    
    // MARK: - Goal IDs for Cooking Masters
    private let masterRecipesGoalId = UUID(uuidString: "77777777-7777-7777-7777-777777777777")!
    private let hostDinnerGoalId = UUID(uuidString: "88888888-8888-8888-8888-888888888888")!
    private let startBlogGoalId = UUID(uuidString: "99999999-9999-9999-9999-999999999999")!
    
    func fetchGroups() async throws -> [Group] {
        try await Task.sleep(nanoseconds: 1_000_000_000)
        
        // FITNESS ENTHUSIASTS GROUP
        let aliceF = Member(id: UUID(), username: "Alice")
        let bobF = Member(id: UUID(), username: "Bob")
        let charlieF = Member(id: UUID(), username: "Charlie")
        
        let runMarathonGoal = Goal(
            id: marathonGoalId,
            title: "Run a Marathon",
            description: "Train and complete a full marathon",
            createdBy: aliceF,
            members: [aliceF, charlieF]
        )
        
        let losePoundsGoal = Goal(
            id: losePoundsGoalId,
            title: "Lose 10 Pounds",
            description: "Follow a strict diet and exercise plan",
            createdBy: bobF,
            members: [bobF]
        )
        
        let cycleGoal = Goal(
            id: cycleGoalId,
            title: "Cycle 100 Miles",
            description: "Participate in a 100-mile cycling event",
            createdBy: charlieF,
            members: [bobF, charlieF]
        )
        
        let fitnessGroup = Group(
            id: UUID(),
            name: "Fitness Enthusiasts",
            description: "Weeknight GYM and CrossFit enthusiasts",
            interests: ["Running", "Cycling", "Weight Loss"],
            members: [aliceF, bobF, charlieF],
            goals: [runMarathonGoal, losePoundsGoal, cycleGoal]
        )
        
        
        // BOOK CLUB GROUP
        let david = Member(id: UUID(), username: "David")
        let eva = Member(id: UUID(), username: "Eva")
        let frank = Member(id: UUID(), username: "Frank")
        
        let readBooksGoal = Goal(
            id: readBooksGoalId,
            title: "Read 20 Books",
            description: "Read 20 different books this year",
            createdBy: david,
            members: [david, eva]
        )
        
        let writeReviewsGoal = Goal(
            id: writeReviewsGoalId,
            title: "Write Book Reviews",
            description: "Write reviews for each book read",
            createdBy: eva,
            members: [eva]
        )
        
        let hostMeetingsGoal = Goal(
            id: hostMeetingsGoalId,
            title: "Host Monthly Meetings",
            description: "Organize and host monthly book discussions",
            createdBy: frank,
            members: [frank]
        )
        
        let bookClubGroup = Group(
            id: UUID(),
            name: "Book Club",
            description: "A community of book lovers discussing, reading, and writing reviews.",
            interests: ["Reading", "Writing", "Discussion"],
            members: [david, eva, frank],
            goals: [readBooksGoal, writeReviewsGoal, hostMeetingsGoal]
        )
        
        
        // COOKING MASTERS GROUP
        let mike = Member(id: UUID(), username: "Mike")
        let nina = Member(id: UUID(), username: "Nina")
        let oliver = Member(id: UUID(), username: "Oliver")
        
        let masterRecipesGoal = Goal(
            id: masterRecipesGoalId,
            title: "Master 50 Recipes",
            description: "Learn and perfect 50 different recipes",
            createdBy: mike,
            members: [mike, nina]
        )
        
        let hostDinnerGoal = Goal(
            id: hostDinnerGoalId,
            title: "Host Dinner Parties",
            description: "Host dinner parties for friends and family",
            createdBy: nina,
            members: [nina]
        )
        
        let startBlogGoal = Goal(
            id: startBlogGoalId,
            title: "Start a Food Blog",
            description: "Create and maintain a food blog",
            createdBy: oliver,
            members: [oliver]
        )
        
        let cookingMastersGroup = Group(
            id: UUID(),
            name: "Cooking Masters",
            description: "Sharing recipes, techniques, and culinary adventures.",
            interests: ["Cooking", "Baking", "Food Blogging"],
            members: [mike, nina, oliver],
            goals: [masterRecipesGoal, hostDinnerGoal, startBlogGoal]
        )
        
        return [fitnessGroup, bookClubGroup, cookingMastersGroup]
    }
    
    func fetchMilestones() async throws -> [Milestone] {
        try await Task.sleep(nanoseconds: 500_000_000)
        var milestones: [Milestone] = []
        
        // FITNESS ENTHUSIASTS GOALS
        
        // "Run a Marathon" milestones:
        // For Alice: 3 milestones (2 completed, 1 pending → ~66% complete)
        let aliceForMarathon = Member(id: UUID(), username: "Alice")
        milestones.append(Milestone(
            title: "Run 5k",
            isCompleted: true,
            dueDate: nil,
            goalId: marathonGoalId,
            createdBy: aliceForMarathon
        ))
        milestones.append(Milestone(
            title: "Run 10k",
            isCompleted: false,
            dueDate: nil,
            goalId: marathonGoalId,
            createdBy: aliceForMarathon
        ))
        milestones.append(Milestone(
            title: "Run 15k",
            isCompleted: true,
            dueDate: nil,
            goalId: marathonGoalId,
            createdBy: aliceForMarathon
        ))
        
        // For Charlie: 2 milestones (1 completed, 1 pending → 50% complete)
        let charlieForMarathon = Member(id: UUID(), username: "Charlie")
        milestones.append(Milestone(
            title: "Interval Training",
            isCompleted: false,
            dueDate: nil,
            goalId: marathonGoalId,
            createdBy: charlieForMarathon
        ))
        milestones.append(Milestone(
            title: "Hill Workout",
            isCompleted: true,
            dueDate: nil,
            goalId: marathonGoalId,
            createdBy: charlieForMarathon
        ))
        
        // "Lose 10 Pounds" milestones:
        // For Bob: 2 milestones (1 completed, 1 pending → 50% complete)
        let bobForLosePounds = Member(id: UUID(), username: "Bob")
        milestones.append(Milestone(
            title: "Follow diet plan",
            isCompleted: true,
            dueDate: nil,
            goalId: losePoundsGoalId,
            createdBy: bobForLosePounds
        ))
        milestones.append(Milestone(
            title: "Track calories",
            isCompleted: false,
            dueDate: nil,
            goalId: losePoundsGoalId,
            createdBy: bobForLosePounds
        ))
        
        // "Cycle 100 Miles" milestones:
        // For Bob: 3 milestones (2 completed, 1 pending → ~66% complete)
        let bobForCycle = Member(id: UUID(), username: "Bob")
        milestones.append(Milestone(
            title: "Cycle 30 miles",
            isCompleted: true,
            dueDate: nil,
            goalId: cycleGoalId,
            createdBy: bobForCycle
        ))
        milestones.append(Milestone(
            title: "Cycle 40 miles",
            isCompleted: false,
            dueDate: nil,
            goalId: cycleGoalId,
            createdBy: bobForCycle
        ))
        milestones.append(Milestone(
            title: "Cycle remaining 30 miles",
            isCompleted: true,
            dueDate: nil,
            goalId: cycleGoalId,
            createdBy: bobForCycle
        ))
        
        // For Charlie: 2 milestones (1 completed, 1 pending → 50% complete)
        let charlieForCycle = Member(id: UUID(), username: "Charlie")
        milestones.append(Milestone(
            title: "Cycle 20 miles",
            isCompleted: false,
            dueDate: nil,
            goalId: cycleGoalId,
            createdBy: charlieForCycle
        ))
        milestones.append(Milestone(
            title: "Cycle 30 miles",
            isCompleted: true,
            dueDate: nil,
            goalId: cycleGoalId,
            createdBy: charlieForCycle
        ))
        
        
        // BOOK CLUB GOALS
        
        // "Read 20 Books" milestones:
        // For David: 3 milestones (2 completed, 1 pending → ~66% complete)
        let davidForReading = Member(id: UUID(), username: "David")
        milestones.append(Milestone(
            title: "Finish reading a book",
            isCompleted: true,
            dueDate: nil,
            goalId: readBooksGoalId,
            createdBy: davidForReading
        ))
        milestones.append(Milestone(
            title: "Finish another book",
            isCompleted: true,
            dueDate: nil,
            goalId: readBooksGoalId,
            createdBy: davidForReading
        ))
        milestones.append(Milestone(
            title: "Finish one more book",
            isCompleted: false,
            dueDate: nil,
            goalId: readBooksGoalId,
            createdBy: davidForReading
        ))
        
        // For Eva: 2 milestones (1 completed, 1 pending → 50% complete)
        let evaForReading = Member(id: UUID(), username: "Eva")
        milestones.append(Milestone(
            title: "Finish reading a book",
            isCompleted: false,
            dueDate: nil,
            goalId: readBooksGoalId,
            createdBy: evaForReading
        ))
        milestones.append(Milestone(
            title: "Finish reading a book",
            isCompleted: true,
            dueDate: nil,
            goalId: readBooksGoalId,
            createdBy: evaForReading
        ))
        
        // "Write Book Reviews" milestones:
        // For Eva: 3 milestones (1 completed, 2 pending → ~33% complete)
        let evaForReview = Member(id: UUID(), username: "Eva")
        milestones.append(Milestone(
            title: "Draft a review",
            isCompleted: true,
            dueDate: nil,
            goalId: writeReviewsGoalId,
            createdBy: evaForReview
        ))
        milestones.append(Milestone(
            title: "Edit draft",
            isCompleted: false,
            dueDate: nil,
            goalId: writeReviewsGoalId,
            createdBy: evaForReview
        ))
        milestones.append(Milestone(
            title: "Finalize review",
            isCompleted: false,
            dueDate: nil,
            goalId: writeReviewsGoalId,
            createdBy: evaForReview
        ))
        
        // "Host Monthly Meetings" milestones:
        // For Frank: 2 milestones (1 completed, 1 pending → 50% complete)
        let frankForMeeting = Member(id: UUID(), username: "Frank")
        milestones.append(Milestone(
            title: "Schedule meeting",
            isCompleted: true,
            dueDate: nil,
            goalId: hostMeetingsGoalId,
            createdBy: frankForMeeting
        ))
        milestones.append(Milestone(
            title: "Send invites",
            isCompleted: false,
            dueDate: nil,
            goalId: hostMeetingsGoalId,
            createdBy: frankForMeeting
        ))
        
        
        // COOKING MASTERS GOALS
        
        // "Master 50 Recipes" milestones:
        // For Mike: 2 milestones (1 completed, 1 pending → 50% complete)
        let mikeForRecipes = Member(id: UUID(), username: "Mike")
        milestones.append(Milestone(
            title: "Cook 10 recipes",
            isCompleted: true,
            dueDate: nil,
            goalId: masterRecipesGoalId,
            createdBy: mikeForRecipes
        ))
        milestones.append(Milestone(
            title: "Review 10 recipes",
            isCompleted: false,
            dueDate: nil,
            goalId: masterRecipesGoalId,
            createdBy: mikeForRecipes
        ))
        // For Nina: 3 milestones (2 completed, 1 pending → ~66% complete)
        let ninaForRecipes = Member(id: UUID(), username: "Nina")
        milestones.append(Milestone(
            title: "Cook 10 recipes",
            isCompleted: true,
            dueDate: nil,
            goalId: masterRecipesGoalId,
            createdBy: ninaForRecipes
        ))
        milestones.append(Milestone(
            title: "Cook 5 recipes",
            isCompleted: false,
            dueDate: nil,
            goalId: masterRecipesGoalId,
            createdBy: ninaForRecipes
        ))
        milestones.append(Milestone(
            title: "Plan menu",
            isCompleted: true,
            dueDate: nil,
            goalId: masterRecipesGoalId,
            createdBy: ninaForRecipes
        ))
        
        // "Host Dinner Parties" milestones:
        // For Nina: 2 milestones (1 completed, 1 pending → 50% complete)
        let ninaForDinner = Member(id: UUID(), username: "Nina")
        milestones.append(Milestone(
            title: "Plan dinner",
            isCompleted: false,
            dueDate: nil,
            goalId: hostDinnerGoalId,
            createdBy: ninaForDinner
        ))
        milestones.append(Milestone(
            title: "Send invitations",
            isCompleted: true,
            dueDate: nil,
            goalId: hostDinnerGoalId,
            createdBy: ninaForDinner
        ))
        
        // "Start a Food Blog" milestones:
        // For Oliver: 2 milestones (1 completed, 1 pending → 50% complete)
        let oliverForBlog = Member(id: UUID(), username: "Oliver")
        milestones.append(Milestone(
            title: "Draft first post",
            isCompleted: true,
            dueDate: nil,
            goalId: startBlogGoalId,
            createdBy: oliverForBlog
        ))
        milestones.append(Milestone(
            title: "Set up website",
            isCompleted: false,
            dueDate: nil,
            goalId: startBlogGoalId,
            createdBy: oliverForBlog
        ))
        
        return milestones
    }
}
