import SwiftUI
public struct ArchivedRowView: View {
    public init() {}
    public var body: some View {
        HStack(spacing: AppConstants.paddingMedium) {
            Image(systemName: "archivebox")
                .foregroundColor(AppColors.textSecondary)
                .font(.system(size: AppConstants.iconSizeMedium))
            Text(AppStrings.archivedChats)
                .font(.system(size: 16, weight: .medium))
                .foregroundColor(AppColors.textPrimary)
            Spacer()
        }
        .padding(.vertical, 4)
    }
}
