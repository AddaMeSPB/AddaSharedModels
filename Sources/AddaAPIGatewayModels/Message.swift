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

final class Message: Model {
    
    static var schema = "messages"
    
    init() {}
    
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
    
    init(_ chatMessage: ChatMessage, senderId: User.IDValue? = nil, receipientId: User.IDValue? = nil) {
        self.$conversation.id =  ObjectId(chatMessage.conversationId)!
        self.$sender.id = senderId
        self.$recipient.id = receipientId
        self.messageBody = chatMessage.messageBody
        self.messageType = chatMessage.messageType
        self.isRead = chatMessage.isRead
        self.isDelivered = chatMessage.isDelivered
    }
    
    @ID(custom: "id") var id: ObjectId?
    @Field(key: "messageBody") var messageBody: String
    @Field(key: "messageType") var messageType: MessageType
    @Field(key: "isRead") var isRead: Bool
    @Field(key: "isDelivered") var isDelivered: Bool
    
    @Parent(key: "conversationId") var conversation: Conversation
    @OptionalParent(key: "sender") var sender: User?
    @OptionalParent(key: "recipient") var recipient: User?
    
    @Timestamp(key: "createdAt", on: .create) var createdAt: Date?
    @Timestamp(key: "updatedAt", on: .update) var updatedAt: Date?
    @Timestamp(key: "deletedAt", on: .delete) var deletedAt: Date?

}

extension Message {
    var response: Item {
        .init(self)
    }
    
    struct Item: Content, Codable {
        
        init(_ message: Message) {
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
        
        let id: ObjectId?
        let messageBody: String
        let messageType: MessageType
        let isRead, isDelivered: Bool
        let sender: User.Response?
        let recipient: User.Response?
        let conversationId: ObjectId
        let updatedAt, createdAt, deletedAt: Date?
    }
}


struct ChatMessage: Codable, Identifiable, Hashable {
    var id: String?
    var conversationId: String
    var sender: User?
    var recipient: User?
    var messageBody: String
    var messageType: MessageType
    var isRead: Bool
    var isDelivered: Bool

    var createdAt: Date?
    var updatedAt: Date?
    var deletedAt: Date?
    
    
    init(_ message: Message) {
        
        if message.id == nil {
            self.id = ObjectId().hexString
        } else {
            self.id = message.id!.hexString
        }

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
    
    func hash(into hasher: inout Hasher) {
        hasher.combine(id)
        hasher.combine(messageBody)
    }
}
