import SwiftUI
public struct MessageBubbleView: View {
    public let message: Message
    public init(message: Message) {
        self.message = message
    }
    public var body: some View {
        HStack {
            if message.isOutgoing {
                Spacer(minLength: 50)
            }
            VStack(alignment: .leading, spacing: 2) {
                if !message.isOutgoing && message.senderName != "Siz" {
                    Text(message.senderName)
                        .font(.system(size: 12, weight: .bold))
                        .foregroundColor(AppColors.tealGreen)
                }
                HStack(alignment: .bottom, spacing: 8) {
                    Text(message.text)
                        .font(.system(size: 15))
                        .foregroundColor(AppColors.textPrimary)
                    HStack(spacing: 3) {
                        Text(message.time)
                            .font(.system(size: 10))
                            .foregroundColor(AppColors.textSecondary)
                        if message.isOutgoing {
                            StatusCheckmarkView(status: message.status)
                        }
                    }
                    .padding(.bottom, 1)
                }
            }
            .padding(.horizontal, 10)
            .padding(.vertical, 6)
            .background(message.isOutgoing ? AppColors.outgoingBubble : AppColors.incomingBubble)
            .cornerRadius(AppConstants.messageBubbleCornerRadius)
            .shadow(color: Color.black.opacity(0.04), radius: 1, x: 0, y: 1)
            if !message.isOutgoing {
                Spacer(minLength: 50)
            }
        }
        .padding(.horizontal, AppConstants.paddingMedium)
        .padding(.vertical, 2)
    }
}
