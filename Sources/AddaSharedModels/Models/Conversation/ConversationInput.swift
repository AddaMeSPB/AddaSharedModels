import Foundation
import BSON

public struct ConversationInput {
    
    public var title: String
    public var type: ConversationType
    public var admins: [UserOutput]
    public var members: [UserOutput]
    public var lastMessage: MessageItem?
    public var createdAt, updatedAt, deletedAt: Date?
    
    public init(
        title: String,
        type: ConversationType,
        admins: [UserOutput],
        members: [UserOutput],
        lastMessage: MessageItem?,
        createdAt: Date? = nil,
        updatedAt: Date? = nil,
        deletedAt: Date? = nil
    ) {
        self.title = title
        self.type = type
        self.admins = admins
        self.members = members
        self.lastMessage = lastMessage
        self.createdAt = createdAt
        self.updatedAt = updatedAt
        self.deletedAt = deletedAt
    }
    
}
extension ConversationInput: Codable {}
