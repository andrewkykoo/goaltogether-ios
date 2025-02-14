import Foundation

struct MemberProgress: Identifiable {
    let member: Member
    let total: Int
    let completed: Int
    var id: UUID { member.id }
}