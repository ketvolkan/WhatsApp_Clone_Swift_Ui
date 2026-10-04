import SwiftUI
public struct StatusCheckmarkView: View {
    public let status: MessageStatus
    public init(status: MessageStatus) {
        self.status = status
    }
    public var body: some View {
        HStack(spacing: -7) {
            switch status {
            case .sent:
                Image(systemName: AppIcons.checkmarkSent)
                    .font(.system(size: AppConstants.iconSizeSmall, weight: .semibold))
                    .foregroundColor(AppColors.textSecondary)
            case .delivered:
                Image(systemName: AppIcons.checkmarkDelivered)
                    .font(.system(size: AppConstants.iconSizeSmall, weight: .semibold))
                    .foregroundColor(AppColors.textSecondary)
                Image(systemName: AppIcons.checkmarkDelivered)
                    .font(.system(size: AppConstants.iconSizeSmall, weight: .semibold))
                    .foregroundColor(AppColors.textSecondary)
            case .read:
                Image(systemName: AppIcons.checkmarkRead)
                    .font(.system(size: AppConstants.iconSizeSmall, weight: .semibold))
                    .foregroundColor(AppColors.readBlue)
                Image(systemName: AppIcons.checkmarkRead)
                    .font(.system(size: AppConstants.iconSizeSmall, weight: .semibold))
                    .foregroundColor(AppColors.readBlue)
            }
        }
    }
}
