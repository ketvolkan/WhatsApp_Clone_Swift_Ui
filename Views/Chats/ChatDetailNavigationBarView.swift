import SwiftUI
public struct ChatDetailNavigationBarView: View {
    public let chat: Chat
    public let onBack: () -> Void
    public init(chat: Chat, onBack: @escaping () -> Void) {
        self.chat = chat
        self.onBack = onBack
    }
    public var body: some View {
        HStack(spacing: AppConstants.paddingSmall) {
            Button(action: onBack) {
                Image(systemName: AppIcons.back)
                    .font(.system(size: AppConstants.iconSizeMedium, weight: .semibold))
                    .foregroundColor(AppColors.tealGreen)
            }
            AvatarImageView(
                iconName: chat.avatarUrl,
                size: AppConstants.avatarSizeSmall
            )
            VStack(alignment: .leading, spacing: 2) {
                Text(chat.name)
                    .font(.system(size: 16, weight: .semibold))
                    .foregroundColor(AppColors.textPrimary)
                    .lineLimit(1)
                Text(chat.isGroup ? "grup" : AppStrings.userOnline)
                    .font(.system(size: 11))
                    .foregroundColor(AppColors.textSecondary)
            }
            Spacer()
            Button(action: {}) {
                Image(systemName: AppIcons.videoCall)
                    .font(.system(size: AppConstants.iconSizeMedium))
                    .foregroundColor(AppColors.tealGreen)
            }
            .padding(.trailing, 6)
            Button(action: {}) {
                Image(systemName: AppIcons.phoneCall)
                    .font(.system(size: AppConstants.iconSizeMedium))
                    .foregroundColor(AppColors.tealGreen)
            }
            .padding(.trailing, 4)
            Button(action: {}) {
                Image(systemName: AppIcons.more)
                    .font(.system(size: AppConstants.iconSizeMedium))
                    .foregroundColor(AppColors.tealGreen)
            }
        }
        .padding(.horizontal, AppConstants.paddingMedium)
        .padding(.vertical, AppConstants.paddingSmall)
        .background(AppColors.barBackground)
    }
}
