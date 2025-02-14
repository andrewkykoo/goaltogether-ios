import Foundation

extension Date {
    /// Returns the reference Monday for scheduling goals.
    ///
    /// When using the ISO 8601 calendar (which defines Monday as the first day of the week),
    /// this property returns the Monday of the current week.
    ///
    /// For example, if today is Wednesday, Feb 12, this property returns Feb 10. 
    /// This ensures that goals meant to be in the past (such as ones with a start date
    /// calculated as this Monday minus some offset) indeed resolve to dates before today.
    var nextMonday: Date {
        let calendar = Calendar(identifier: .iso8601)
        // Obtain the Monday of the current week.
        guard let thisWeekMonday = calendar.date(from: calendar.dateComponents([.yearForWeekOfYear, .weekOfYear], from: self)) else {
            fatalError("Failed to compute this week's Monday")
        }
        return thisWeekMonday
    }
} 