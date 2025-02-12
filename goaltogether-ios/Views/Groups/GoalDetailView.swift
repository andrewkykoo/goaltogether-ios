import SwiftUI

struct GoalDetailView: View {
    let goal: Goal
    @StateObject private var viewModel: GoalDetailViewModel

    init(goal: Goal) {
        self.goal = goal
        _viewModel = StateObject(wrappedValue: GoalDetailViewModel(goal: goal))
    }
    
    var body: some View {
        List {
            Section(header: Text("Goal Info")) {
                VStack(alignment: .leading, spacing: 4) {
                    Text(goal.description)
                        .font(.body)
                        .padding(.bottom, 10)
                    Text("Created by: \(goal.createdBy.username)")
                        .font(.footnote)
                        .foregroundColor(.secondary)
                }
            }
            
            Section(header: Text("Participants")) {
                if goal.members.isEmpty {
                    Text("No members joined yet.")
                        .foregroundColor(.secondary)
                } else {
                    ForEach(goal.members) { member in
                        ParticipantProgressView(member: member, goalId: goal.id, milestones: viewModel.milestones)
                    }
                }
            }
        }
        .listStyle(InsetGroupedListStyle())
        .navigationTitle(goal.title)
        .navigationBarTitleDisplayMode(.inline)
        .refreshable {
            // Re-fetch milestone data on pull-to-refresh.
            await viewModel.fetchMilestones()
        }
        .task {
            // Initial data fetch.
            await viewModel.fetchMilestones()
        }
    }
}

struct ParticipantProgressView: View {
    let member: Member
    let goalId: UUID
    let milestones: [Milestone]
    
    var body: some View {
        // Filter milestones based on the goal and member (using username in this demo).
        let memberMilestones = milestones.filter { $0.goalId == goalId && $0.createdBy.username == member.username }
        let totalCount = memberMilestones.count
        let completedCount = memberMilestones.filter { $0.isCompleted }.count
        let progress: Double = totalCount > 0 ? Double(completedCount) / Double(totalCount) : 0.0
        
        return VStack(alignment: .leading, spacing: 4) {
            HStack {
                Text(member.username)
                Spacer()
                if totalCount > 0 {
                    // Now shows milestone count along with the percentage (e.g. 6/10 (60%))
                    Text("\(completedCount)/\(totalCount) (\(Int(progress * 100))%)")
                        .font(.caption)
                } else {
                    Text("No milestones")
                        .font(.caption)
                        .foregroundColor(.secondary)
                }
            }
            ProgressView(value: progress)
                .progressViewStyle(LinearProgressViewStyle())
        }
        .padding(.vertical, 4)
    }
}

struct GoalDetailView_Previews: PreviewProvider {
    static var previews: some View {
        // Use the same fixed UUID as defined in your MockDataService for "Run a Marathon".
        let fixedMarathonGoalId = UUID(uuidString: "11111111-1111-1111-1111-111111111111")!
        NavigationView {
            GoalDetailView(goal: Goal(
                id: fixedMarathonGoalId,
                title: "Run a Marathon",
                description: "Train and complete a full marathon",
                createdBy: Member(username: "Alice"),
                members: [
                    Member(username: "Alice"),
                    Member(username: "Charlie")
                ]
            ))
        }
    }
} 
