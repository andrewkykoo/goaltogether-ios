import SwiftUI

struct GoalCellView: View {
    let goal: Goal
    
    var body: some View {
        VStack(alignment: .leading, spacing: 4) {
            Text(goal.title)
                .font(.headline)
            Text(goal.description)
                .font(.subheadline)
                .foregroundColor(.secondary)
            Text("started by \(goal.createdBy.username)")
                .font(.footnote)
                .foregroundColor(.secondary)
            
        }
        .padding(.vertical, 4)
    }
}

struct GoalCellView_Previews: PreviewProvider {
    static var previews: some View {
        GoalCellView(goal: Goal(
            id: UUID(),
            title: "Sample Goal",
            description: "Goal description",
            createdBy: Member(username: "Alice"),
            members: [Member(username: "Alice"), Member(username: "Bob")]
        ))
        .previewLayout(.sizeThatFits)
    }
}
