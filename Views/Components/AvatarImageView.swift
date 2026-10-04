import SwiftUI
public struct AvatarImageView: View {
    public let iconName: String
    public let size: CGFloat
    public let backgroundColor: Color
    public init(
        iconName: String = AppIcons.defaultAvatar,
        size: CGFloat = AppConstants.avatarSizeMedium,
        backgroundColor: Color = AppColors.barBackground
    ) {
        self.iconName = iconName
        self.size = size
        self.backgroundColor = backgroundColor
    }
    public var body: some View {
        ZStack {
            Circle()
                .fill(backgroundColor)
                .frame(width: size, height: size)
            Image(systemName: iconName)
                .resizable()
                .scaledToFit()
                .frame(width: size * 0.6, height: size * 0.6)
                .foregroundColor(AppColors.textSecondary)
        }
    }
}
