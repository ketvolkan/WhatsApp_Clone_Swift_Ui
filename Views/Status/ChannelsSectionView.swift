import SwiftUI
public struct ChannelsSectionView: View {
    public init() {}
    public var body: some View {
        VStack(alignment: .leading, spacing: 8) {
            Text(AppStrings.channelsSubtitle)
                .font(.system(size: 14))
                .foregroundColor(AppColors.textSecondary)
            Button(action: {}) {
                Text(AppStrings.exploreChannels)
                    .font(.system(size: 14, weight: .semibold))
                    .foregroundColor(AppColors.tealGreen)
                    .padding(.vertical, 4)
            }
        }
        .padding(.vertical, 4)
    }
}
