import Foundation
public struct User: Identifiable, Codable, Hashable {
    public let id: String
    public let name: String
    public let phoneNumber: String
    public let about: String
    public let avatarUrl: String
    public init(
        id: String,
        name: String,
        phoneNumber: String,
        about: String,
        avatarUrl: String
    ) {
        self.id = id
        self.name = name
        self.phoneNumber = phoneNumber
        self.about = about
        self.avatarUrl = avatarUrl
    }
}
