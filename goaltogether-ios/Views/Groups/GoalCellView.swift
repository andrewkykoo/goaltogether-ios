import SwiftUI

struct GoalCellView: View {
    let goal: Goal
    
    var body: some View {
        HStack {
            VStack(alignment: .leading, spacing: 4) {
                Text(goal.title)
                    .font(.headline)
                if !goal.description.isEmpty {
                    Text(goal.description)
                        .font(.caption)
                        .foregroundColor(.secondary)
                        .lineLimit(2)
                }
                // Optionally display how many members have joined the goal.
                Text("\(goal.members.count) member\(goal.members.count == 1 ? "" : "s")")
                    .font(.caption2)
                    .foregroundColor(.gray)
            }
            .padding(.vertical, 8)
            Spacer()
        }
    }
}

struct GoalCellView_Previews: PreviewProvider {
    static var previews: some View {
        GoalCellView(goal: Goal(
            id: UUID(),
            title: "Sample Goal",
            description: "A brief description of the goal.",
            createdBy: Member(username: "Alice"),
            members: [Member(username: "Alice"), Member(username: "Bob")]
        ))
        .previewLayout(.sizeThatFits)
    }
}
