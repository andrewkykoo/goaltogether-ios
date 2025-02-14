import Foundation
import SwiftUI

@MainActor
class GroupListViewModel: ObservableObject {
    @Published var allGroups: [Group] = []
    @Published var searchText: String = ""
    
    private let dataService: DataService
    // In a real app, these could come from the current user's preferences.
    private let recommendedInterests: [String] = ["Running", "Cooking"]
    
    init(dataService: DataService = MockDataService()) {
        self.dataService = dataService
    }
    
    func fetchGroups() async {
        do {
            let groups = try await dataService.fetchGroups()
            self.allGroups = groups
        } catch {
            print("Error fetching groups: \(error)")
        }
    }
    
    var displayedGroups: [Group] {
        if searchText.isEmpty {
            // Show recommended groups based on the recommended interests.
            return allGroups.filter { group in
                group.interests.contains { interest in
                    recommendedInterests.contains { $0.lowercased() == interest.lowercased() }
                }
            }
        } else {
            // Filter groups where the name or interests contain the search keyword.
            let query = searchText.lowercased()
            return allGroups.filter { group in
                group.name.lowercased().contains(query) ||
                group.interests.contains { $0.lowercased().contains(query) }
            }
        }
    }
} 
