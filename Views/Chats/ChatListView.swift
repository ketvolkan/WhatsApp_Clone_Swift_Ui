import SwiftUI
public struct ChatListView: View {
    @StateObject private var viewModel = ChatListViewModel()
    public init() {}
    public var body: some View {
        NavigationView {
            List {
                ChatFilterBarView(
                    searchText: $viewModel.searchText,
                    selectedFilter: $viewModel.selectedFilter
                )
                .listRowInsets(EdgeInsets(top: 4, leading: 16, bottom: 4, trailing: 16))
                .listRowSeparator(.hidden)
                ArchivedRowView()
                    .listRowInsets(EdgeInsets(top: 8, leading: 16, bottom: 8, trailing: 16))
                ForEach(viewModel.filteredChats) { chat in
                    ZStack {
                        NavigationLink(destination: ChatDetailView(chat: chat)) {
                            EmptyView()
                        }
                        .opacity(0)
                        ChatRowView(chat: chat)
                    }
                    .listRowInsets(EdgeInsets(top: 6, leading: 16, bottom: 6, trailing: 16))
                }
            }
            .listStyle(PlainListStyle())
            .navigationTitle(AppStrings.tabChats)
            #if os(iOS)
            .navigationBarTitleDisplayMode(.large)
            #endif
            .toolbar {
                #if os(iOS)
                ToolbarItem(placement: .navigationBarLeading) {
                    Button(AppStrings.editButton) {}
                        .foregroundColor(AppColors.tealGreen)
                }
                ToolbarItemGroup(placement: .navigationBarTrailing) {
                    Button(action: {}) {
                        Image(systemName: AppIcons.camera)
                            .foregroundColor(AppColors.tealGreen)
                    }
                    Button(action: {}) {
                        Image(systemName: AppIcons.newChat)
                            .foregroundColor(AppColors.tealGreen)
                    }
                }
                #else
                ToolbarItemGroup(placement: .primaryAction) {
                    Button(action: {}) {
                        Image(systemName: AppIcons.camera)
                            .foregroundColor(AppColors.tealGreen)
                    }
                    Button(action: {}) {
                        Image(systemName: AppIcons.newChat)
                            .foregroundColor(AppColors.tealGreen)
                    }
                }
                #endif
            }
            .task {
                await viewModel.loadChats()
            }
        }
    }
}
