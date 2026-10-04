import Foundation
import Combine
@MainActor
public final class StatusViewModel: ObservableObject {
    @Published public var currentUser: User? = nil
    @Published public var recentStatuses: [StatusItem] = []
    @Published public var viewedStatuses: [StatusItem] = []
    @Published public var isLoading: Bool = false
    @Published public var errorMessage: String? = nil
    private let repository: WhatsAppRepositoryProtocol
    public init(repository: WhatsAppRepositoryProtocol = WhatsAppRepository.shared) {
        self.repository = repository
    }
    public func loadStatuses() async {
        isLoading = true
        errorMessage = nil
        do {
            async let userTask = repository.fetchCurrentUser()
            async let statusesTask = repository.fetchStatuses()
            let (user, statuses) = try await (userTask, statusesTask)
            self.currentUser = user
            self.recentStatuses = statuses.filter { !$0.isViewed }
            self.viewedStatuses = statuses.filter { $0.isViewed }
        } catch {
            errorMessage = error.localizedDescription
        }
        isLoading = false
    }
}
