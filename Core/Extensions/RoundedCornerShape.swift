import SwiftUI
#if canImport(UIKit)
import UIKit
#endif
public struct RoundedCornerShape: Shape {
    public var radius: CGFloat
    #if canImport(UIKit)
    public var corners: UIRectCorner
    public init(radius: CGFloat = .infinity, corners: UIRectCorner = .allCorners) {
        self.radius = radius
        self.corners = corners
    }
    public func path(in rect: CGRect) -> Path {
        let path = UIBezierPath(
            roundedRect: rect,
            byRoundingCorners: corners,
            cornerRadii: CGSize(width: radius, height: radius)
        )
        return Path(path.cgPath)
    }
    #else
    public init(radius: CGFloat = .infinity) {
        self.radius = radius
    }
    public func path(in rect: CGRect) -> Path {
        var path = Path()
        path.addRoundedRect(in: rect, cornerSize: CGSize(width: radius, height: radius))
        return path
    }
    #endif
}
