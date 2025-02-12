import SwiftUI

struct GroupCellView: View {
    let group: Group
    
    var body: some View {
        VStack(alignment: .leading, spacing: 6) {
            Text(group.name)
                .font(.headline)
            if !group.interests.isEmpty {
                Text("Interests: \(group.interests.joined(separator: ", "))")
                    .font(.subheadline)
                    .foregroundColor(.secondary)
            }
            Text("Members: \(group.members.count)")
                .font(.subheadline)
                .foregroundColor(.secondary)
        }
        .padding(.vertical, 8)
    }
}


#Preview {
    GroupCellView(group: Group(
        id: UUID(),
        name: "Sample Group",
        description: "Sample Description....",
        interests: ["Reading", "Cooking"],
        members: [
            Member(username: "Alice"),
            Member(username: "Bob")
        ],
        goals: []
    ))
}
