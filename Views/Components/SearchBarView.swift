import SwiftUI
public struct SearchBarView: View {
    @Binding public var text: String
    public let placeholder: String
    public init(text: Binding<String>, placeholder: String = AppStrings.searchPlaceholder) {
        self._text = text
        self.placeholder = placeholder
    }
    public var body: some View {
        HStack {
            Image(systemName: AppIcons.search)
                .foregroundColor(AppColors.textSecondary)
                .font(.system(size: AppConstants.iconSizeMedium))
            TextField(placeholder, text: $text)
                .foregroundColor(AppColors.textPrimary)
                .font(.subheadline)
            if !text.isEmpty {
                Button(action: {
                    text = ""
                }) {
                    Image(systemName: AppIcons.clear)
                        .foregroundColor(AppColors.textSecondary)
                        .font(.system(size: AppConstants.iconSizeSmall))
                }
            }
        }
        .padding(.horizontal, AppConstants.paddingSmall)
        .padding(.vertical, 7)
        .background(AppColors.searchBarBackground)
        .cornerRadius(AppConstants.cornerRadiusSmall)
    }
}
