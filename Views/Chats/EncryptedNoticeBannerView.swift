import SwiftUI
public struct EncryptedNoticeBannerView: View {
    public init() {}
    public var body: some View {
        Text(AppStrings.encryptedNotice)
            .font(.system(size: 11))
            .multilineTextAlignment(.center)
            .foregroundColor(AppColors.textSecondary)
            .padding(.horizontal, AppConstants.paddingMedium)
            .padding(.vertical, 6)
            .background(Color.yellow.opacity(0.18))
            .cornerRadius(AppConstants.cornerRadiusSmall)
            .padding(.horizontal, AppConstants.paddingLarge)
            .padding(.top, AppConstants.paddingSmall)
    }
}
