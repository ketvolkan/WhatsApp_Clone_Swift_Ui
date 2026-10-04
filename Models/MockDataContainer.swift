import Foundation
public struct MockDataContainer: Codable {
    public let currentUser: User
    public let chats: [Chat]
    public let messages: [String: [Message]]
    public let statuses: [StatusItem]
    public let calls: [CallLog]
    public init(
        currentUser: User,
        chats: [Chat],
        messages: [String: [Message]],
        statuses: [StatusItem],
        calls: [CallLog]
    ) {
        self.currentUser = currentUser
        self.chats = chats
        self.messages = messages
        self.statuses = statuses
        self.calls = calls
    }
}
