import SwiftUI
public struct StatusRowView: View {
    public let statusItem: StatusItem
    public init(statusItem: StatusItem) {
        self.statusItem = statusItem
    }
    public var body: some View {
        HStack(spacing: AppConstants.paddingMedium) {
            AvatarImageView(
                iconName: statusItem.avatarUrl,
                size: AppConstants.avatarSizeStatus
            )
            .overlay(
                Circle()
                    .stroke(
                        statusItem.isViewed ? AppColors.statusRingViewed : AppColors.statusRingUnviewed,
                        style: StrokeStyle(
                            lineWidth: 2.5,
                            dash: statusItem.statusCount > 1 ? [CGFloat(280 / max(statusItem.statusCount, 1)) - 5, 5] : []
                        )
                    )
            )
            VStack(alignment: .leading, spacing: 4) {
                Text(statusItem.userName)
                    .font(.system(size: 16, weight: .semibold))
                    .foregroundColor(AppColors.textPrimary)
                Text(statusItem.timeAgo)
                    .font(.system(size: 13))
                    .foregroundColor(AppColors.textSecondary)
            }
            Spacer()
        }
        .padding(.vertical, 4)
    }
}
