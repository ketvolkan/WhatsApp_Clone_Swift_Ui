import SwiftUI
public struct MyStatusRowView: View {
    public let avatarUrl: String
    public init(avatarUrl: String) {
        self.avatarUrl = avatarUrl
    }
    public var body: some View {
        HStack(spacing: AppConstants.paddingMedium) {
            ZStack(alignment: .bottomTrailing) {
                AvatarImageView(
                    iconName: avatarUrl,
                    size: AppConstants.avatarSizeStatus
                )
                Image(systemName: AppIcons.addStatus)
                    .font(.system(size: 20))
                    .foregroundColor(AppColors.primaryGreen)
                    .background(Color.white)
                    .clipShape(Circle())
                    .offset(x: 2, y: 2)
            }
            VStack(alignment: .leading, spacing: 4) {
                Text(AppStrings.myStatus)
                    .font(.system(size: 16, weight: .semibold))
                    .foregroundColor(AppColors.textPrimary)
                Text(AppStrings.addStatusSubtitle)
                    .font(.system(size: 13))
                    .foregroundColor(AppColors.textSecondary)
            }
            Spacer()
        }
        .padding(.vertical, 4)
    }
}
