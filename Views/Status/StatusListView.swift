import SwiftUI
public struct StatusListView: View {
    @StateObject private var viewModel = StatusViewModel()
    public init() {}
    public var body: some View {
        NavigationView {
            List {
                Section {
                    MyStatusRowView(
                        avatarUrl: viewModel.currentUser?.avatarUrl ?? AppIcons.defaultAvatar
                    )
                }
                if !viewModel.recentStatuses.isEmpty {
                    Section(header: Text(AppStrings.recentUpdates).font(.system(size: 14, weight: .semibold))) {
                        ForEach(viewModel.recentStatuses) { item in
                            StatusRowView(statusItem: item)
                        }
                    }
                }
                if !viewModel.viewedStatuses.isEmpty {
                    Section(header: Text(AppStrings.viewedUpdates).font(.system(size: 14, weight: .semibold))) {
                        ForEach(viewModel.viewedStatuses) { item in
                            StatusRowView(statusItem: item)
                        }
                    }
                }
                Section(header: Text(AppStrings.channelsHeader).font(.system(size: 14, weight: .semibold))) {
                    ChannelsSectionView()
                }
            }
            #if os(iOS)
            .listStyle(InsetGroupedListStyle())
            .navigationBarTitleDisplayMode(.large)
            #endif
            .navigationTitle(AppStrings.tabUpdates)
            .toolbar {
                #if os(iOS)
                ToolbarItemGroup(placement: .navigationBarTrailing) {
                    Button(action: {}) {
                        Image(systemName: AppIcons.camera)
                            .foregroundColor(AppColors.tealGreen)
                    }
                    Button(action: {}) {
                        Image(systemName: AppIcons.more)
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
                        Image(systemName: AppIcons.more)
                            .foregroundColor(AppColors.tealGreen)
                    }
                }
                #endif
            }
            .task {
                await viewModel.loadStatuses()
            }
        }
    }
}
