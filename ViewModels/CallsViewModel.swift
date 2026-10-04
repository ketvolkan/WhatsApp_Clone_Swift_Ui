import Foundation
import Combine
@MainActor
public final class CallsViewModel: ObservableObject {
    @Published public var calls: [CallLog] = []
    @Published public var searchText: String = ""
    @Published public var isLoading: Bool = false
    @Published public var errorMessage: String? = nil
    private let repository: WhatsAppRepositoryProtocol
    public init(repository: WhatsAppRepositoryProtocol = WhatsAppRepository.shared) {
        self.repository = repository
    }
    public var filteredCalls: [CallLog] {
        if searchText.trimmingCharacters(in: .whitespacesAndNewlines).isEmpty {
            return calls
        }
        return calls.filter {
            $0.callerName.lowercased().contains(searchText.lowercased())
        }
    }
    public func loadCalls() async {
        isLoading = true
        errorMessage = nil
        do {
            calls = try await repository.fetchCalls()
        } catch {
            errorMessage = error.localizedDescription
        }
        isLoading = false
    }
}
