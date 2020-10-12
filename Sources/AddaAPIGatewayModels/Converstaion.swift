//
//  Conversation.swift
//  
//
//  Created by Saroar Khandoker on 25.09.2020.
//

import Foundation
import Vapor
import Fluent
import FluentMongoDriver

public final class Conversation: Model, Content {
    
    public static var schema = "conversations"
    
    public init() {}
    
    public init(title: String) {
        self.title = title
    }

    @ID(custom: "id") public var id: ObjectId?
    @Field(key: "title") public var title: String

    @Children(for: \.$conversation) public var conversation: [Event]
    @Children(for: \.$conversation) public var chatMessages: [Message]
    
    @Siblings(through: UserConversation.self, from: \.$conversation, to: \.$member)
    public var members: [User]
    
    @Siblings(through: UserConversation.self, from: \.$conversation, to: \.$admin)
    public var admins: [User]
    
    @Timestamp(key: "createdAt", on: .create) public var createdAt: Date?
    @Timestamp(key: "updatedAt", on: .update) public var updatedAt: Date?
    @Timestamp(key: "deletedAt", on: .delete) public var deletedAt: Date?
    
    public func addUser(userId: ObjectId, req: Request) {
        User.find(userId, on: req.db)
            .unwrap(or: Abort(.notFound, reason: "Cant find user") )
            .flatMap { user in
                    self.$admins.attach(user, on: req.db).flatMap {
                    self.$members.attach(user, on: req.db)
                }
            }
    }

}

public struct ChatConversation: Codable {
    public var id: ObjectId
    public var title: String
    public var members: Set<User>?
    public var admins: Set<User>?
    public var messages: [Message]?
    public let createdAt, updatedAt: Date?
}

public struct ConversationWithKids: Content {
    public let id: ObjectId?
    public let title: String
    public let admins: [User.Response]
    public let members: [User.Response]
    public let lastMessage: Message.Item?
}