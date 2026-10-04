import Foundation
public struct Message: Identifiable, Codable, Hashable {
    public let id: String
    public let chatId: String
    public let senderId: String
    public let senderName: String
    public let text: String
    public let time: String
    public let isOutgoing: Bool
    public let status: MessageStatus
    public init(
        id: String,
        chatId: String,
        senderId: String,
        senderName: String,
        text: String,
        time: String,
        isOutgoing: Bool,
        status: MessageStatus
    ) {
        self.id = id
        self.chatId = chatId
        self.senderId = senderId
        self.senderName = senderName
        self.text = text
        self.time = time
        self.isOutgoing = isOutgoing
        self.status = status
    }
}
