import SwiftUI
public struct FilterChipView: View {
    public let title: String
    public let isSelected: Bool
    public let action: () -> Void
    public init(
        title: String,
        isSelected: Bool,
        action: @escaping () -> Void
    ) {
        self.title = title
        self.isSelected = isSelected
        self.action = action
    }
    public var body: some View {
        Button(action: action) {
            Text(title)
                .font(.system(size: 13, weight: .medium))
                .foregroundColor(isSelected ? AppColors.darkGreen : AppColors.textSecondary)
                .padding(.horizontal, AppConstants.paddingMedium)
                .padding(.vertical, 6)
                .background(isSelected ? AppColors.outgoingBubble : AppColors.searchBarBackground)
                .clipShape(Capsule())
        }
    }
}
