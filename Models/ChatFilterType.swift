import Foundation
public enum ChatFilterType: String, CaseIterable, Identifiable {
    case all = "Tümü"
    case unread = "Okunmamış"
    case groups = "Gruplar"
    public var id: String { rawValue }
}
