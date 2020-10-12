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

final class Conversation: Model, Content {
    
    static var schema = "conversations"
    
    init() {}
    
    init(title: String) {
        self.title = title
    }

    @ID(custom: "id") var id: ObjectId?
    @Field(key: "title") var title: String

    @Children(for: \.$conversation) var conversation: [Event]
    @Children(for: \.$conversation) var chatMessages: [Message]
    
    @Siblings(through: UserConversation.self, from: \.$conversation, to: \.$member)
    public var members: [User]
    
    @Siblings(through: UserConversation.self, from: \.$conversation, to: \.$admin)
    public var admins: [User]
    
    @Timestamp(key: "createdAt", on: .create) var createdAt: Date?
    @Timestamp(key: "updatedAt", on: .update) var updatedAt: Date?
    @Timestamp(key: "deletedAt", on: .delete) var deletedAt: Date?
    
    func addUser(userId: ObjectId, req: Request) {
        User.find(userId, on: req.db)
            .unwrap(or: Abort(.notFound, reason: "Cant find user") )
            .flatMap { user in
                    self.$admins.attach(user, on: req.db).flatMap {
                    self.$members.attach(user, on: req.db)
                }
            }
    }

}

struct ChatConversation: Codable {
    var id: ObjectId
    var title: String
    var members: Set<User>?
    var admins: Set<User>?
    var messages: [Message]?
    
    let createdAt: Date?
    let updatedAt: Date?
}

struct ConversationWithKids: Content {
    let id: ObjectId?
    let title: String
    let admins: [User.Response]
    let members: [User.Response]
    let lastMessage: Message.Item?
}
