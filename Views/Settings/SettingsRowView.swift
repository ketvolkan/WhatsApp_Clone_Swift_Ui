import SwiftUI
public struct SettingsRowView: View {
    public let iconName: String
    public let iconColor: Color
    public let title: String
    public let subtitle: String?
    public init(
        iconName: String,
        iconColor: Color,
        title: String,
        subtitle: String? = nil
    ) {
        self.iconName = iconName
        self.iconColor = iconColor
        self.title = title
        self.subtitle = subtitle
    }
    public var body: some View {
        HStack(spacing: AppConstants.paddingMedium) {
            ZStack {
                RoundedRectangle(cornerRadius: 7)
                    .fill(iconColor)
                    .frame(width: 30, height: 30)
                Image(systemName: iconName)
                    .font(.system(size: AppConstants.iconSizeSmall, weight: .semibold))
                    .foregroundColor(.white)
            }
            VStack(alignment: .leading, spacing: 2) {
                Text(title)
                    .font(.system(size: 16))
                    .foregroundColor(AppColors.textPrimary)
                if let subtitle = subtitle {
                    Text(subtitle)
                        .font(.system(size: 13))
                        .foregroundColor(AppColors.textSecondary)
                }
            }
            Spacer()
            Image(systemName: AppIcons.chevronRight)
                .font(.system(size: AppConstants.iconSizeSmall, weight: .semibold))
                .foregroundColor(AppColors.textSecondary)
        }
        .padding(.vertical, 3)
    }
}
