import SwiftUI
public struct CreateCallLinkRowView: View {
    public init() {}
    public var body: some View {
        HStack(spacing: AppConstants.paddingMedium) {
            ZStack {
                Circle()
                    .fill(AppColors.outgoingBubble)
                    .frame(
                        width: AppConstants.avatarSizeSmall + 6,
                        height: AppConstants.avatarSizeSmall + 6
                    )
                Image(systemName: "link")
                    .font(.system(size: AppConstants.iconSizeMedium))
                    .foregroundColor(AppColors.tealGreen)
            }
            VStack(alignment: .leading, spacing: 2) {
                Text(AppStrings.createCallLink)
                    .font(.system(size: 16, weight: .semibold))
                    .foregroundColor(AppColors.tealGreen)
                Text(AppStrings.callLinkSubtitle)
                    .font(.system(size: 13))
                    .foregroundColor(AppColors.textSecondary)
            }
            Spacer()
        }
        .padding(.vertical, 4)
    }
}
