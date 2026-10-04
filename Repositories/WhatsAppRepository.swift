import Foundation
public final class WhatsAppRepository: WhatsAppRepositoryProtocol {
    public static let shared = WhatsAppRepository()
    private let dataLoader: JsonDataLoaderProtocol
    private var cachedData: MockDataContainer?
    private var sentMessages: [String: [Message]] = [:]
    public init(dataLoader: JsonDataLoaderProtocol = LocalJsonService.shared) {
        self.dataLoader = dataLoader
    }
    private func ensureDataLoaded() async throws -> MockDataContainer {
        if let cached = cachedData {
            return cached
        }
        let container: MockDataContainer = try await dataLoader.load(
            MockDataContainer.self,
            filename: AppConstants.mockDataFileName,
            withExtension: AppConstants.jsonExtension
        )
        self.cachedData = container
        return container
    }
    public func fetchCurrentUser() async throws -> User {
        let container = try await ensureDataLoaded()
        return container.currentUser
    }
    public func fetchChats() async throws -> [Chat] {
        let container = try await ensureDataLoaded()
        return container.chats
    }
    public func fetchMessages(for chatId: String) async throws -> [Message] {
        let container = try await ensureDataLoaded()
        var messages = container.messages[chatId] ?? []
        if let newMessages = sentMessages[chatId] {
            messages.append(contentsOf: newMessages)
        }
        return messages
    }
    public func sendMessage(chatId: String, text: String) async throws -> Message {
        let formatter = DateFormatter()
        formatter.dateFormat = "HH:mm"
        let currentTimeString = formatter.string(from: Date())
        let newMessage = Message(
            id: UUID().uuidString,
            chatId: chatId,
            senderId: "user_me",
            senderName: "Siz",
            text: text,
            time: currentTimeString,
            isOutgoing: true,
            status: .read
        )
        if sentMessages[chatId] == nil {
            sentMessages[chatId] = []
        }
        sentMessages[chatId]?.append(newMessage)
        return newMessage
    }
    public func fetchStatuses() async throws -> [StatusItem] {
        let container = try await ensureDataLoaded()
        return container.statuses
    }
    public func fetchCalls() async throws -> [CallLog] {
        let container = try await ensureDataLoaded()
        return container.calls
    }
}
