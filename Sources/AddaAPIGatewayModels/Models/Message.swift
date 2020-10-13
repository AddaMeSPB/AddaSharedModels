//
//  Message.swift
//  
//
//  Created by Saroar Khandoker on 02.10.2020.
//

import Foundation
import Vapor
import Fluent
import FluentMongoDriver

public final class Message: Model {
    
    public static var schema = "messages"
    
    public init() {}
    
//    init(messageItem: Item) {
//        self.id = ObjectId(messageItem.id)
//        self.$conversation.id = messageItem.conversationId
//        self.sender = messageItem.sender
//        self.recipient = messageItem.recipient
//        self.messageBody = messageItem.messageBody
//        self.messageType = messageItem.messageType
//        self.isRead = messageItem.isRead
//        self.isDelivered = messageItem.isDelivered
//    }
    
    public init(_ chatMessage: ChatMessage, senderId: User.IDValue? = nil, receipientId: User.IDValue? = nil) {
        self.$conversation.id =  ObjectId(chatMessage.conversationId)!
        self.$sender.id = senderId
        self.$recipient.id = receipientId
        self.messageBody = chatMessage.messageBody
        self.messageType = chatMessage.messageType
        self.isRead = chatMessage.isRead
        self.isDelivered = chatMessage.isDelivered
    }
    
    @ID(custom: "id") public var id: ObjectId?
    @Field(key: "messageBody") public var messageBody: String
    @Field(key: "messageType") public var messageType: MessageType
    @Field(key: "isRead") public var isRead: Bool
    @Field(key: "isDelivered") public var isDelivered: Bool
    
    @Parent(key: "conversationId") public var conversation: Conversation
    @OptionalParent(key: "sender") public var sender: User?
    @OptionalParent(key: "recipient") public var recipient: User?
    
    @Timestamp(key: "createdAt", on: .create) public var createdAt: Date?
    @Timestamp(key: "updatedAt", on: .update) public var updatedAt: Date?
    @Timestamp(key: "deletedAt", on: .delete) public var deletedAt: Date?

}

extension Message {
    public var response: Item {
        .init(self)
    }
    
    public struct Item: Content, Codable {
        
        public init(_ message: Message) {
            self.id = message.id
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
        
        public let id: ObjectId?
        public let messageBody: String
        public let messageType: MessageType
        public let isRead, isDelivered: Bool
        public let sender: User.Response?
        public let recipient: User.Response?
        public let conversationId: ObjectId
        public let updatedAt, createdAt, deletedAt: Date?
    }
}


public struct ChatMessage: Codable, Identifiable, Hashable {
    public var id: ObjectId?
    public var conversationId: String
    public var sender: User?
    public var recipient: User?
    public var messageBody: String
    public var messageType: MessageType
    public var isRead: Bool
    public var isDelivered: Bool

    public var createdAt, updatedAt, deletedAt: Date?
    
    public init(_ message: Message) {
        self.id = message.id
        self.conversationId = message.conversation.id?.hexString ?? ""
        self.sender = message.sender ?? User.init()
        self.recipient = message.recipient
        self.messageBody = message.messageBody
        self.messageType = message.messageType
        self.isRead = message.isRead
        self.isDelivered = message.isDelivered
        self.createdAt = message.createdAt
        self.updatedAt = message.updatedAt
        self.deletedAt = message.deletedAt
    }
    
    public func hash(into hasher: inout Hasher) {
        hasher.combine(id)
        hasher.combine(messageBody)
    }
}
