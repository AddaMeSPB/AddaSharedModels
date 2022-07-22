
#if os(macOS) || os(Linux)
import Vapor
import Fluent
import FluentMongoDriver

public final class Message: Model {
  
  public static var schema = "messages"
  
  public init() {}
  
  public init(
    _ messageItem: MessageItem,
    senderId: User.IDValue? = nil,
    receipientId: User.IDValue? = nil
  ) {
    self.$conversation.id =  messageItem.conversationId
    self.$sender.id = messageItem.sender?.id
    self.$recipient.id = messageItem.recipient?.id
    self.messageBody = messageItem.messageBody
    self.messageType = messageItem.messageType
    self.isRead = messageItem.isRead ?? false
    self.isDelivered = messageItem.isDelivered ?? false
  }
  
  @ID(custom: "id") public var id: ObjectId?
  @Field(key: "messageBody") public var messageBody: String
  @Field(key: "messageType") public var messageType: MessageType
  @Field(key: "isRead") public var isRead: Bool
  @Field(key: "isDelivered") public var isDelivered: Bool
  
  @Parent(key: "conversationId") public var conversation: Conversation
  @OptionalParent(key: "senderId") public var sender: User?
  @OptionalParent(key: "recipientId") public var recipient: User?
  
  @Timestamp(key: "createdAt", on: .create) public var createdAt: Date?
  @Timestamp(key: "updatedAt", on: .update) public var updatedAt: Date?
  @Timestamp(key: "deletedAt", on: .delete) public var deletedAt: Date?
  
}

extension Message {
  public var response: MessageItem { .init(self) }
}

extension MessageItem: Content {}

extension MessageItem {
    public init(_ message: Message) {
      self.id = message.id ?? ObjectId()
      self.conversationId = message.$conversation.id
      self.sender = message.sender?.response
      self.recipient = message.recipient?.response
      self.messageBody = message.messageBody
      self.messageType = message.messageType
      self.isRead = message.isRead
      self.isDelivered = message.isDelivered
      self.createdAt = message.createdAt
      self.updatedAt = message.updatedAt
      self.deletedAt = message.deletedAt
    }
}

#endif
