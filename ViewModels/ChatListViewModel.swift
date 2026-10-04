import Foundation
import Combine
@MainActor
public final class ChatListViewModel: ObservableObject {
    @Published public var chats: [Chat] = []
    @Published public var searchText: String = ""
    @Published public var selectedFilter: ChatFilterType = .all
    @Published public var isLoading: Bool = false
    @Published public var errorMessage: String? = nil
    private let repository: WhatsAppRepositoryProtocol
    public init(repository: WhatsAppRepositoryProtocol = WhatsAppRepository.shared) {
        self.repository = repository
    }
    public var filteredChats: [Chat] {
        var result = chats
        switch selectedFilter {
        case .all:
            break
        case .unread:
            result = result.filter { $0.unreadCount > 0 }
        case .groups:
            result = result.filter { $0.isGroup }
        }
        if !searchText.trimmingCharacters(in: .whitespacesAndNewlines).isEmpty {
            let query = searchText.lowercased()
            result = result.filter {
                $0.name.lowercased().contains(query) ||
                $0.lastMessageText.lowercased().contains(query)
            }
        }
        return result
    }
    public func loadChats() async {
        isLoading = true
        errorMessage = nil
        do {
            chats = try await repository.fetchChats()
        } catch {
            errorMessage = error.localizedDescription
        }
        isLoading = false
    }
}
