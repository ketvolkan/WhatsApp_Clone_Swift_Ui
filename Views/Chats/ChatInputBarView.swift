import SwiftUI
public struct ChatInputBarView: View {
    @Binding public var text: String
    public let onSend: () -> Void
    public init(text: Binding<String>, onSend: @escaping () -> Void) {
        self._text = text
        self.onSend = onSend
    }
    public var body: some View {
        HStack(spacing: AppConstants.paddingSmall) {
            Button(action: {}) {
                Image(systemName: AppIcons.plus)
                    .font(.system(size: AppConstants.iconSizeMedium, weight: .medium))
                    .foregroundColor(AppColors.tealGreen)
            }
            .frame(width: 32, height: 32)
            HStack {
                TextField(AppStrings.typeMessagePlaceholder, text: $text)
                    .font(.system(size: 15))
                    .foregroundColor(AppColors.textPrimary)
                if text.trimmingCharacters(in: .whitespacesAndNewlines).isEmpty {
                    Button(action: {}) {
                        Image(systemName: AppIcons.camera)
                            .font(.system(size: AppConstants.iconSizeMedium))
                            .foregroundColor(AppColors.textSecondary)
                    }
                }
            }
            .padding(.horizontal, AppConstants.paddingMedium)
            .padding(.vertical, 8)
            .background(AppColors.incomingBubble)
            .cornerRadius(AppConstants.cornerRadiusLarge)
            .overlay(
                RoundedRectangle(cornerRadius: AppConstants.cornerRadiusLarge)
                    .stroke(AppColors.divider, lineWidth: 1)
            )
            if text.trimmingCharacters(in: .whitespacesAndNewlines).isEmpty {
                Button(action: {}) {
                    Image(systemName: AppIcons.microphone)
                        .font(.system(size: AppConstants.iconSizeMedium))
                        .foregroundColor(AppColors.tealGreen)
                        .frame(width: 36, height: 36)
                }
            } else {
                Button(action: onSend) {
                    Image(systemName: AppIcons.send)
                        .font(.system(size: AppConstants.iconSizeMedium))
                        .foregroundColor(.white)
                        .frame(width: 36, height: 36)
                        .background(AppColors.tealGreen)
                        .clipShape(Circle())
                }
            }
        }
        .padding(.horizontal, AppConstants.paddingMedium)
        .padding(.vertical, AppConstants.paddingSmall)
        .background(AppColors.barBackground)
    }
}
