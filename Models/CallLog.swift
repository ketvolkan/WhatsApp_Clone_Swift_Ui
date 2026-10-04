import Foundation
public struct CallLog: Identifiable, Codable, Hashable {
    public let id: String
    public let callerName: String
    public let callType: CallType
    public let isVideo: Bool
    public let time: String
    public let avatarUrl: String
    public init(
        id: String,
        callerName: String,
        callType: CallType,
        isVideo: Bool,
        time: String,
        avatarUrl: String
    ) {
        self.id = id
        self.callerName = callerName
        self.callType = callType
        self.isVideo = isVideo
        self.time = time
        self.avatarUrl = avatarUrl
    }
}
