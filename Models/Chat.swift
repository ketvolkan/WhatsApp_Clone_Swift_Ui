import Foundation
public struct Chat: Identifiable, Codable, Hashable {
    public let id: String
    public let name: String
    public let avatarUrl: String
    public let isGroup: Bool
    public let isPinned: Bool
    public let unreadCount: Int
    public let lastMessageText: String
    public let lastMessageTime: String
    public let lastMessageStatus: MessageStatus
    public let lastMessageIsOutgoing: Bool
    public init(
        id: String,
        name: String,
        avatarUrl: String,
        isGroup: Bool,
        isPinned: Bool,
        unreadCount: Int,
        lastMessageText: String,
        lastMessageTime: String,
        lastMessageStatus: MessageStatus,
        lastMessageIsOutgoing: Bool
    ) {
        self.id = id
        self.name = name
        self.avatarUrl = avatarUrl
        self.isGroup = isGroup
        self.isPinned = isPinned
        self.unreadCount = unreadCount
        self.lastMessageText = lastMessageText
        self.lastMessageTime = lastMessageTime
        self.lastMessageStatus = lastMessageStatus
        self.lastMessageIsOutgoing = lastMessageIsOutgoing
    }
}
