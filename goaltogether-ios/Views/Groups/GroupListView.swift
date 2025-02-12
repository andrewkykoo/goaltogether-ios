import SwiftUI

struct GroupListView: View {
    @EnvironmentObject private var viewModel: GroupListViewModel
    
    var body: some View {
        NavigationView {
            SwiftUI.Group {
                if viewModel.allGroups.isEmpty {
                    ProgressView("Loading groups...")
                        .frame(maxWidth: .infinity, maxHeight: .infinity)
                } else {
                    List(viewModel.displayedGroups) { group in
                        NavigationLink {
                            GroupDetailView(group: group)
                        } label: {
                            GroupCellView(group: group)
                        }
                    }
                    .listStyle(PlainListStyle())
                }
            }
            .navigationTitle("Explore")
            .searchable(text: $viewModel.searchText, prompt: "Search groups")
            .refreshable {
                await viewModel.fetchGroups()
            }
        }
        .task {
            await viewModel.fetchGroups()
        }
    }
}

#Preview {
    GroupListView()
        .environmentObject(GroupListViewModel())
}
