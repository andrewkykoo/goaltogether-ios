//
//  GoalDetailViewModel.swift
//  goaltogether-ios
//
//  Created by Andrew Koo on 2/11/25.
//

import Foundation
import SwiftUI
import Combine

class GoalDetailViewModel: ObservableObject {
    @Published var goal: Goal
    @Published var milestones: [Milestone] = []
    
    // For demonstration, we'll assume the current user is "Alice".
    // Replace this with your authentication/session logic.
    let currentUser: Member = Member(id: UUID(uuidString: "AAAAAAAA-AAAA-AAAA-AAAA-AAAAAAAAAAAA")!,
                                       username: "Alice")
    
    private let dataService: DataService

    init(goal: Goal, dataService: DataService = MockDataService()) {
        self.goal = goal
        self.dataService = dataService
        
        // Sample milestones for demonstration:
        self.milestones = [
            // Milestones for the current user (Alice)
            Milestone(title: "Set your personal plan", goalId: goal.id, createdBy: currentUser),
            Milestone(title: "Complete first milestone", isCompleted: true, goalId: goal.id, createdBy: currentUser),
            
            // Milestones for another team member (Bob)
            Milestone(title: "Review progress", goalId: goal.id, createdBy: Member(id: UUID(), username: "Bob")),
            Milestone(title: "Finalize milestone", isCompleted: true, goalId: goal.id, createdBy: Member(id: UUID(), username: "Bob"))
        ]
    }

    func fetchMilestones() async {
        do {
            let allMilestones = try await dataService.fetchMilestones()
            // Filter milestones for the current goal.
            let goalMilestones = allMilestones.filter { $0.goalId == self.goal.id }
            await MainActor.run {
                // Only update if the service returns non-empty data.
                if !goalMilestones.isEmpty {
                    self.milestones = goalMilestones
                } else {
                    print("No matching milestones found from service for goal \(self.goal.id); retaining initial sample data.")
                }
            }
        } catch {
            print("Error fetching milestones: \(error)")
        }
    }
    
    /// Aggregates progress for all members based on the number of milestones completed.
    var membersProgress: [MemberProgress] {
        var progressByMember: [UUID: (member: Member, total: Int, completed: Int)] = [:]
        for milestone in milestones {
            let memberId = milestone.createdBy.id
            if progressByMember[memberId] == nil {
                progressByMember[memberId] = (member: milestone.createdBy, total: 0, completed: 0)
            }
            progressByMember[memberId]?.total += 1
            if milestone.isCompleted {
                progressByMember[memberId]?.completed += 1
            }
        }
        
        return progressByMember.map { (_, value) in
            MemberProgress(member: value.member, total: value.total, completed: value.completed)
        }
    }
} 