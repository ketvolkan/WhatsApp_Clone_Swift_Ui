import SwiftUI
public struct MainTabView: View {
    @State private var selectedTab: Int = 3
    public init() {}
    public var body: some View {
        TabView(selection: $selectedTab) {
            StatusListView()
                .tabItem {
                    Image(systemName: AppIcons.tabUpdates)
                    Text(AppStrings.tabUpdates)
                }
                .tag(0)
            CallsListView()
                .tabItem {
                    Image(systemName: AppIcons.tabCalls)
                    Text(AppStrings.tabCalls)
                }
                .tag(1)
            CommunitiesView()
                .tabItem {
                    Image(systemName: AppIcons.tabCommunities)
                    Text(AppStrings.tabCommunities)
                }
                .tag(2)
            ChatListView()
                .tabItem {
                    Image(systemName: AppIcons.tabChats)
                    Text(AppStrings.tabChats)
                }
                .tag(3)
            SettingsView()
                .tabItem {
                    Image(systemName: AppIcons.tabSettings)
                    Text(AppStrings.tabSettings)
                }
                .tag(4)
        }
        .accentColor(AppColors.tealGreen)
    }
}
