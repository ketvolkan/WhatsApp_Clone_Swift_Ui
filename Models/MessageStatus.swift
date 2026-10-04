import Foundation
public enum MessageStatus: String, Codable, CaseIterable {
    case sent = "sent"
    case delivered = "delivered"
    case read = "read"
}
