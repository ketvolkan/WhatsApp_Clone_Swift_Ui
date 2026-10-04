import SwiftUI
public struct CallRowView: View {
    public let call: CallLog
    public init(call: CallLog) {
        self.call = call
    }
    public var body: some View {
        HStack(spacing: AppConstants.paddingMedium) {
            AvatarImageView(
                iconName: call.avatarUrl,
                size: AppConstants.avatarSizeSmall + 6
            )
            VStack(alignment: .leading, spacing: 4) {
                Text(call.callerName)
                    .font(.system(size: 16, weight: .medium))
                    .foregroundColor(call.callType == .missed ? AppColors.missedCallRed : AppColors.textPrimary)
                HStack(spacing: 4) {
                    Image(systemName: callTypeIcon)
                        .font(.system(size: AppConstants.iconSizeSmall))
                        .foregroundColor(callTypeColor)
                    Text(call.time)
                        .font(.system(size: 13))
                        .foregroundColor(AppColors.textSecondary)
                }
            }
            Spacer()
            Button(action: {}) {
                Image(systemName: call.isVideo ? AppIcons.videoCall : AppIcons.phoneCall)
                    .font(.system(size: AppConstants.iconSizeMedium))
                    .foregroundColor(AppColors.tealGreen)
            }
        }
        .padding(.vertical, 4)
    }
    private var callTypeIcon: String {
        switch call.callType {
        case .incoming:
            return AppIcons.callIncoming
        case .outgoing:
            return AppIcons.callOutgoing
        case .missed:
            return AppIcons.callMissed
        }
    }
    private var callTypeColor: Color {
        switch call.callType {
        case .missed:
            return AppColors.missedCallRed
        default:
            return AppColors.textSecondary
        }
    }
}
