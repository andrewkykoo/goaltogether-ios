import Foundation
import SwiftUI

class GoalDetailViewModel: ObservableObject {
    let goal: Goal
    @Published var milestones: [Milestone] = []
    
    private let dataService: DataService

    init(goal: Goal, dataService: DataService = MockDataService()) {
        self.goal = goal
        self.dataService = dataService
    }

    func fetchMilestones() async {
        do {
            let allMilestones = try await dataService.fetchMilestones()
            // Filter milestones for the current goal.
            let goalMilestones = allMilestones.filter { $0.goalId == self.goal.id }
            // Update on the main actor.
            await MainActor.run {
                self.milestones = goalMilestones
            }
        } catch {
            print("Error fetching milestones: \(error)")
        }
    }
} 