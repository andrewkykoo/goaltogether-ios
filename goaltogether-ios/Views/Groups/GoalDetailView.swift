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
                VStack(alignment: .leading, spacing: 8) {
                    Text(goal.description)
                        .font(.body)
                    Text("Created by: \(goal.createdBy.username)")
                        .font(.footnote)
                        .foregroundColor(.secondary)
                }
                .padding(.vertical, 4)
            }
            
            // Members Progress Section (aggregated for all members)
            Section(header: Text("Members Progress")) {
                if viewModel.membersProgress.isEmpty {
                    Text("No milestones have been set up yet.")
                        .foregroundColor(.secondary)
                } else {
                    ForEach(viewModel.membersProgress) { progress in
                        VStack(alignment: .leading, spacing: 8) {
                            HStack {
                                Text(progress.member.username)
                                    .font(.subheadline)
                                Spacer()
                                let fraction = Double(progress.completed) / Double(progress.total)
                                let percentage = Int(fraction * 100)
                                Text("\(percentage)% (\(progress.completed)/\(progress.total))")
                                    .font(.caption)
                                    .foregroundColor(.gray)
                            }
                            ProgressView(value: Double(progress.completed), total: Double(progress.total))
                                .progressViewStyle(LinearProgressViewStyle())
                        }
                        .padding(.vertical, 4)
                    }
                }
            }
        }
        .listStyle(InsetGroupedListStyle())
        .task {
            await viewModel.fetchMilestones()
        }
        .navigationTitle(goal.title)
        .navigationBarTitleDisplayMode(.inline)
    }
}

struct GoalDetailView_Previews: PreviewProvider {
    static var previews: some View {
        NavigationStack {
            GoalDetailView(goal: Goal(
                id: UUID(),
                title: "Run a Marathon",
                description: "Train to complete a full marathon at your own pace.",
                createdBy: Member(username: "Alice"),
                members: [Member(username: "Alice"), Member(username: "Charlie")]
            ))
        }
    }
} 
