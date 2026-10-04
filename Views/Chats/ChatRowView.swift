import SwiftUI
public struct ChatRowView: View {
    public let chat: Chat
    public init(chat: Chat) {
        self.chat = chat
    }
    public var body: some View {
        HStack(spacing: AppConstants.paddingMedium) {
            AvatarImageView(
                iconName: chat.avatarUrl,
                size: AppConstants.avatarSizeMedium
            )
            VStack(alignment: .leading, spacing: 4) {
                HStack {
                    Text(chat.name)
                        .font(.system(size: 16, weight: .semibold))
                        .foregroundColor(AppColors.textPrimary)
                        .lineLimit(1)
                    Spacer()
                    Text(chat.lastMessageTime)
                        .font(.system(size: 12))
                        .foregroundColor(chat.unreadCount > 0 ? AppColors.unreadBadge : AppColors.textSecondary)
                }
                HStack(spacing: 4) {
                    if chat.lastMessageIsOutgoing {
                        StatusCheckmarkView(status: chat.lastMessageStatus)
                    }
                    Text(chat.lastMessageText)
                        .font(.system(size: 14))
                        .foregroundColor(AppColors.textSecondary)
                        .lineLimit(2)
                    Spacer()
                    if chat.isPinned {
                        Image(systemName: AppIcons.pin)
                            .font(.system(size: AppConstants.iconSizeSmall))
                            .foregroundColor(AppColors.textSecondary)
                            .rotationEffect(.degrees(45))
                    }
                    BadgeView(count: chat.unreadCount)
                }
            }
        }
        .padding(.vertical, 4)
    }
}
