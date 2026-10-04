import Foundation
import Combine
@MainActor
public final class SettingsViewModel: ObservableObject {
    @Published public var currentUser: User? = nil
    @Published public var isLoading: Bool = false
    @Published public var errorMessage: String? = nil
    private let repository: WhatsAppRepositoryProtocol
    public init(repository: WhatsAppRepositoryProtocol = WhatsAppRepository.shared) {
        self.repository = repository
    }
    public func loadUser() async {
        isLoading = true
        errorMessage = nil
        do {
            currentUser = try await repository.fetchCurrentUser()
        } catch {
            errorMessage = error.localizedDescription
        }
        isLoading = false
    }
}
