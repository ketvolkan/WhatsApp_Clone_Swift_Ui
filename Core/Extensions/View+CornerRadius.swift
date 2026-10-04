import SwiftUI
#if canImport(UIKit)
import UIKit
public extension View {
    func customCornerRadius(_ radius: CGFloat, corners: UIRectCorner) -> some View {
        clipShape(RoundedCornerShape(radius: radius, corners: corners))
    }
}
#else
public extension View {
    func customCornerRadius(_ radius: CGFloat) -> some View {
        clipShape(RoundedCornerShape(radius: radius))
    }
}
#endif
