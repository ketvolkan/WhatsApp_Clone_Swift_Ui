import SwiftUI
public struct ProfileHeaderCardView: View {
    public let user: User?
    public init(user: User?) {
        self.user = user
    }
    public var body: some View {
        HStack(spacing: AppConstants.paddingMedium) {
            AvatarImageView(
                iconName: user?.avatarUrl ?? AppIcons.defaultAvatar,
                size: AppConstants.avatarSizeLarge
            )
            VStack(alignment: .leading, spacing: 4) {
                Text(user?.name ?? "Kullanıcı")
                    .font(.system(size: 19, weight: .semibold))
                    .foregroundColor(AppColors.textPrimary)
                Text(user?.about ?? "")
                    .font(.system(size: 14))
                    .foregroundColor(AppColors.textSecondary)
                    .lineLimit(1)
            }
            Spacer()
            Image(systemName: AppIcons.qrCode)
                .font(.system(size: AppConstants.iconSizeMedium))
                .foregroundColor(AppColors.tealGreen)
                .padding(8)
                .background(AppColors.searchBarBackground)
                .clipShape(Circle())
        }
        .padding(.vertical, 4)
    }
}
