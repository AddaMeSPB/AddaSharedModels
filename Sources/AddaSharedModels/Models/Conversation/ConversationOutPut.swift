import Foundation
import BSON

public struct ConversationOutPut: Identifiable {
    public var id: ObjectId
    public var title: String
    public var type: ConversationType
    public var admins: [UserOutput]?
    public var members: [UserOutput]?
    public var lastMessage: MessageItem?
    public var createdAt, updatedAt: Date
    public var deletedAt: Date?
    
    public init(
        id: ObjectId,
        title: String,
        type: ConversationType,
        admins: [UserOutput]? = nil,
        members: [UserOutput]? = nil,
        lastMessage: MessageItem?,
        createdAt: Date,
        updatedAt: Date,
        deletedAt: Date? = nil
    ) {
        self.id = id
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

extension ConversationOutPut: Codable {}

extension ConversationOutPut: Hashable {
    
    public func hash(into hasher: inout Hasher) {
        hasher.combine(id)
    }
    
    public static func == (lhs: ConversationOutPut, rhs: ConversationOutPut) -> Bool {
        lhs.id == rhs.id &&
        lhs.lastMessage == rhs.lastMessage
    }
    
    public static func < (lhs: ConversationOutPut, rhs: ConversationOutPut) -> Bool {
        guard let lhsLstMsg = lhs.lastMessage, let rhsLstMsg = rhs.lastMessage,
              let lhsDate = lhsLstMsg.updatedAt, let rhsDate = rhsLstMsg.updatedAt
        else { return false }

        return lhsDate > rhsDate
    }
}

extension ConversationOutPut: Comparable {}

extension ConversationOutPut {
    
    public var ifAttacmentsNotEmpty: Bool {
        guard
            let lstMsg = lastMessage,
            let sender = lstMsg.sender,
            let attacments = sender.attachments
        else {
            return false
        }

        return attacments.last != nil
    }

    public var imageUrlString: String {
        guard
            ifAttacmentsNotEmpty,
            let lstMsg = lastMessage,
            let sender = lstMsg.sender,
            let attacment = sender.attachments,
            let lastAttacment = attacment.last,
            let imageUrlString = lastAttacment.imageUrlString
        else {
            return ""
        }

        return imageUrlString
    }
}

public struct ConversationOutPutOneToOneChat: Identifiable, Codable {
    public var id: ObjectId
    public var title: String
    public var type: ConversationType
    public var lastMessage: MessageItem?
    public var createdAt, updatedAt, deletedAt: Date?
    
    public init(
        id: ObjectId,
        title: String,
        type: ConversationType,
        lastMessage: MessageItem?,
        createdAt: Date? = nil,
        updatedAt: Date? = nil,
        deletedAt: Date? = nil
    ) {
        self.id = id
        self.title = title
        self.type = type
        self.lastMessage = lastMessage
        self.createdAt = createdAt
        self.updatedAt = updatedAt
        self.deletedAt = deletedAt
    }
}
