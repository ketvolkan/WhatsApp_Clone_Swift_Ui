import SwiftUI
public struct CommunitiesView: View {
    public init() {}
    public var body: some View {
        NavigationView {
            CommunityHeroView()
                .background(AppColors.listBackground)
                .navigationTitle(AppStrings.tabCommunities)
                #if os(iOS)
                .navigationBarTitleDisplayMode(.large)
                #endif
        }
    }
}
