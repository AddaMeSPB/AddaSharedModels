
#if os(macOS) || os(Linux)
import Vapor
import Fluent
import FluentKit
import FluentMongoDriver

public final class Conversation: Model {
    
    public static var schema = "conversations"
    
    @ID(custom: "id") public var id: ObjectId?
    @Field(key: "title") public var title: String
    @Field(key: "type") public var type: ConversationType
    
    @Children(for: \.$conversation) public var events: [Event]
    @Children(for: \.$conversation) public var messages: [Message]
    @OptionalField(key: "lastMessage") public var lastMessage: Message?
    
    @Siblings(through: UserConversation.self, from: \.$conversation, to: \.$member)
    public var members: [User]
    
    @Siblings(through: UserConversation.self, from: \.$conversation, to: \.$admin)
    public var admins: [User]
    
    @Timestamp(key: "createdAt", on: TimestampTrigger.create) public var createdAt: Date?
    @Timestamp(key: "updatedAt", on: TimestampTrigger.update) public var updatedAt: Date?
    @Timestamp(key: "deletedAt", on: TimestampTrigger.delete) public var deletedAt: Date?
    
    public init() {}
    
    public init(
        id: ObjectId? = nil,
        title: String,
        lastMessage: Message? = nil,
        type: ConversationType
    ) {
        self.title = title
        self.type = type
        self.lastMessage = lastMessage
    }
    
}

extension Conversation: Content {}
extension ConversationOutPut: Content {}
extension ConversationOutPutOneToOneChat: Content {}
extension ConversationCreate: Content {}

extension Conversation {
    public var response: ConversationOutPut { .init(self) }
}

extension ConversationOutPut {
    public init(_ conversation: Conversation) {
        id = conversation.id ?? ObjectId()
        title = conversation.title
        type = conversation.type
        members = conversation.members.map { $0.response }
        admins = conversation.admins.map { $0.response }
        
        lastMessage = conversation.lastMessage?.response
        createdAt = conversation.createdAt
        updatedAt = conversation.updatedAt
        deletedAt = conversation.deletedAt
    }
    
    //    public var wSconversation: Conversation {
    //      .init(
    //        id: id, title: title, type: type,
    //        members: nil, admins: nil, lastMessage: nil,
    //        createdAt: Date(), updatedAt: Date()
    //      )
    //    }
}
#endif
