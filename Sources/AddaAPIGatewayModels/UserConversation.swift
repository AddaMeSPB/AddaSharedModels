//
//  UserConversation.swift
//  
//
//  Created by Saroar Khandoker on 12.10.2020.
//

import Foundation
import Vapor
import Fluent
import FluentMongoDriver

final class UserConversation: Model {
    static let schema = "user_conversation_pivot"
    
    @ID(custom: "id") var id: ObjectId?
    
    //@Parent(key: "user_id") var user: User
    @Parent(key: "member") var member: User
    @Parent(key: "admin") var admin: User
    @Parent(key: "conversationId") var conversation: Conversation

    init() { }
    
    init(id: ObjectId? = nil, user: User, conversation: Conversation) throws {
        self.id = id
        self.$member.id = try user.requireID()
        self.$admin.id = try user.requireID()
        self.$conversation.id = try conversation.requireID()
    }
}
