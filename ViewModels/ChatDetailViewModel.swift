import Foundation
import Combine
@MainActor
public final class ChatDetailViewModel: ObservableObject {
    @Published public var messages: [Message] = []
    @Published public var messageText: String = ""
    @Published public var isLoading: Bool = false
    @Published public var errorMessage: String? = nil
    private let repository: WhatsAppRepositoryProtocol
    public init(repository: WhatsAppRepositoryProtocol = WhatsAppRepository.shared) {
        self.repository = repository
    }
    public func loadMessages(for chatId: String) async {
        isLoading = true
        errorMessage = nil
        do {
            messages = try await repository.fetchMessages(for: chatId)
        } catch {
            errorMessage = error.localizedDescription
        }
        isLoading = false
    }
    public func sendMessage(for chatId: String) async {
        let trimmed = messageText.trimmingCharacters(in: .whitespacesAndNewlines)
        guard !trimmed.isEmpty else { return }
        messageText = ""
        do {
            let createdMessage = try await repository.sendMessage(chatId: chatId, text: trimmed)
            messages.append(createdMessage)
        } catch {
            errorMessage = error.localizedDescription
        }
    }
}
