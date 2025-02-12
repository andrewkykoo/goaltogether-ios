import SwiftUI

struct GroupDetailView: View {
    let group: Group
    
    var body: some View {
        List {
            // Group Info Section
            Section(header: Text("Group Info")) {
                VStack(alignment: .leading, spacing: 4) {
                    Text(group.description)
                        .font(.body)
                        .padding(.bottom, 10)
                    if !group.interests.isEmpty {
                        Text("Interests: \(group.interests.joined(separator: ", "))")
                            .font(.subheadline)
                            .foregroundColor(.secondary)
                    }
                }
            }
            // Goals Section: each goal is passed to GoalDetailView
            Section(header: Text("Goals")) {
                ForEach(group.goals) { goal in
                    NavigationLink {
                        GoalDetailView(goal: goal)
                    } label: {
                        GoalCellView(goal: goal)
                    }
                }
            }
            // Members Section
            Section(header: Text("Members")) {
                ForEach(group.members) { member in
                    Text(member.username)
                        .font(.subheadline)
                }
            }
        }
        .listStyle(InsetGroupedListStyle())
        .navigationTitle(group.name)
        .navigationBarTitleDisplayMode(.inline)
        .refreshable {
            // Simulate a refresh. For dynamic data, fetch the updated group details.
            try? await Task.sleep(nanoseconds: 500_000_000)
        }
    }
}

struct GroupDetailView_Previews: PreviewProvider {
    static var previews: some View {
        NavigationView {
            GroupDetailView(group: Group(
                id: UUID(),
                name: "Sample Group",
                description: "This is a sample description for the group.",
                interests: ["Reading", "Cooking"],
                members: [
                    Member(username: "Alice"),
                    Member(username: "Bob")
                ],
                goals: [
                    Goal(
                        id: UUID(),
                        title: "Sample Goal",
                        description: "Goal description",
                        createdBy: Member(username: "Alice"),
                        members: [
                            Member(username: "Alice"),
                            Member(username: "Bob")
                        ]
                    )
                ]
            ))
        }
    }
}
