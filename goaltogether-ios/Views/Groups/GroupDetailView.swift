import SwiftUI

// Helper view that displays flashing text with an SF Symbol arrow.
struct FlashingTooltip: View {
    let text: String
    @State private var opacity: Double = 1.0

    var body: some View {
        HStack(spacing: 2) {
            Text(text)
            Image(systemName: "arrow.up.right")
        }
        .font(.caption2)
        .foregroundColor(.cyan)
        .opacity(opacity)
        .onAppear {
            withAnimation(Animation.easeInOut(duration: 1.0).repeatForever(autoreverses: true)) {
                opacity = 0.0
            }
        }
    }
}

struct GroupDetailView: View {
    let group: Group
    @State private var isMember: Bool = false  // Simulated membership state

    // Custom Goals section header with a flashing tooltip.
    private var goalsSectionHeader: some View {
        HStack(spacing: 4) {
            Text("Goals")
            if !isMember {
                FlashingTooltip(text: "join to view details")
            }
        }
        .font(.subheadline)
        .foregroundColor(.secondary)
    }
    
    var body: some View {
        List {
            // Group Info Section.
            Section(header: Text("Group Info")
                        .font(.subheadline)
                        .foregroundColor(.secondary)) {
                VStack(alignment: .leading, spacing: 4) {
                    Text(group.description)
                        .font(.body)
                    if !group.interests.isEmpty {
                        Text("Interests: \(group.interests.joined(separator: ", "))")
                            .font(.subheadline)
                            .foregroundColor(.secondary)
                    }
                }
                .padding(.vertical, 4)
            }
            
            // Goals Section using our custom header.
            Section(header: goalsSectionHeader) {
                if group.goals.isEmpty {
                    Text("No goals available.")
                        .foregroundColor(.secondary)
                } else {
                    ForEach(group.goals) { goal in
                        if isMember {
                            NavigationLink(destination: GoalDetailView(goal: goal)) {
                                GoalCellView(goal: goal)
                            }
                        } else {
                            GoalCellView(goal: goal)
                                .disabled(true)
                        }
                    }
                }
            }
        }
        .listStyle(InsetGroupedListStyle())
        .navigationTitle(group.name)
        .navigationBarTitleDisplayMode(.inline)
        .toolbar {
            // Join button in top-right.
            ToolbarItem(placement: .navigationBarTrailing) {
                if !isMember {
                    Button("Join") {
                        print("Join group pressed for group: \(group.name)")
                        withAnimation {
                            isMember = true
                        }
                    }
                }
            }
        }
    }
}

struct GroupDetailView_Previews: PreviewProvider {
    static var previews: some View {
        NavigationStack {
            GroupDetailView(group: Group(
                id: UUID(),
                name: "Book Club",
                description: "A place for readers to discuss and share insights.",
                interests: ["Fiction", "Self-Improvement"],
                members: [
                    Member(username: "Alice"),
                    Member(username: "Dave")
                ],
                goals: [
                    Goal(
                        id: UUID(),
                        title: "Read 20 Books",
                        description: "Join the challenge to read 20 inspiring books.",
                        createdBy: Member(username: "Alice"),
                        members: []
                    ),
                    Goal(
                        id: UUID(),
                        title: "Attend Author Event",
                        description: "Participate in a live chat with your favorite author.",
                        createdBy: Member(username: "Dave"),
                        members: []
                    )
                ]
            ))
        }
    }
}
