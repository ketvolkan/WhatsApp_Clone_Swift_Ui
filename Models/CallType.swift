import Foundation
public enum CallType: String, Codable, CaseIterable {
    case incoming = "incoming"
    case outgoing = "outgoing"
    case missed = "missed"
}
