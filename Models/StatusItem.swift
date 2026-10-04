import Foundation
public struct StatusItem: Identifiable, Codable, Hashable {
    public let id: String
    public let userName: String
    public let timeAgo: String
    public let statusCount: Int
    public let isViewed: Bool
    public let avatarUrl: String
    public init(
        id: String,
        userName: String,
        timeAgo: String,
        statusCount: Int,
        isViewed: Bool,
        avatarUrl: String
    ) {
        self.id = id
        self.userName = userName
        self.timeAgo = timeAgo
        self.statusCount = statusCount
        self.isViewed = isViewed
        self.avatarUrl = avatarUrl
    }
}
