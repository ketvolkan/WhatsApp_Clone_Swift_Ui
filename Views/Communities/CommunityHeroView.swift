import SwiftUI
public struct CommunityHeroView: View {
    public init() {}
    public var body: some View {
        VStack(spacing: AppConstants.paddingExtraLarge) {
            Spacer()
            ZStack {
                Circle()
                    .fill(AppColors.searchBarBackground)
                    .frame(width: 140, height: 140)
                Image(systemName: AppIcons.tabCommunities)
                    .resizable()
                    .scaledToFit()
                    .frame(width: 70, height: 70)
                    .foregroundColor(AppColors.tealGreen)
            }
            VStack(spacing: AppConstants.paddingSmall) {
                Text(AppStrings.communitiesTitle)
                    .font(.system(size: 22, weight: .bold))
                    .foregroundColor(AppColors.textPrimary)
                Text(AppStrings.communitiesSubtitle)
                    .font(.system(size: 15))
                    .foregroundColor(AppColors.textSecondary)
                    .multilineTextAlignment(.center)
                    .padding(.horizontal, AppConstants.paddingExtraLarge)
            }
            Button(action: {}) {
                Text(AppStrings.newCommunityButton)
                    .font(.system(size: 16, weight: .semibold))
                    .foregroundColor(.white)
                    .frame(maxWidth: .infinity)
                    .padding(.vertical, 14)
                    .background(AppColors.tealGreen)
                    .cornerRadius(AppConstants.cornerRadiusLarge)
            }
            .padding(.horizontal, AppConstants.paddingExtraLarge)
            Spacer()
        }
    }
}
