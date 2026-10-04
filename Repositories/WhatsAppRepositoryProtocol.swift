import Foundation
public protocol WhatsAppRepositoryProtocol {
    func fetchCurrentUser() async throws -> User
    func fetchChats() async throws -> [Chat]
    func fetchMessages(for chatId: String) async throws -> [Message]
    func sendMessage(chatId: String, text: String) async throws -> Message
    func fetchStatuses() async throws -> [StatusItem]
    func fetchCalls() async throws -> [CallLog]
}
