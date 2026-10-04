import SwiftUI
public struct BadgeView: View {
    public let count: Int
    public init(count: Int) {
        self.count = count
    }
    public var body: some View {
        if count > 0 {
            Text("\(count)")
                .font(.system(size: 11, weight: .bold))
                .foregroundColor(.white)
                .frame(minWidth: 18, minHeight: 18)
                .padding(.horizontal, 4)
                .background(AppColors.unreadBadge)
                .clipShape(Capsule())
        }
    }
}
