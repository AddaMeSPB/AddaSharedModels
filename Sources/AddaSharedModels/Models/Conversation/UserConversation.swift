//
//  UserConversation.swift
//  
//
//  Created by Saroar Khandoker on 12.10.2020.
//

import Foundation

#if os(macOS) || os(Linux)
import Vapor
import Fluent
import FluentMongoDriver

public final class UserConversation: Model {
    public static let schema = "user_conversation_pivot"
    
    @ID(custom: "id") public var id: ObjectId?
    
    //@Parent(key: "user_id") var user: User
    @Parent(key: "memberId") public var member: User
    @Parent(key: "adminId") public var admin: User
    @Parent(key: "conversationId")  public var conversation: Conversation
    
    @Timestamp(key: "createdAt", on: .create) public var createdAt: Date?
    @Timestamp(key: "updatedAt", on: .update) public var updatedAt: Date?
    @Timestamp(key: "deletedAt", on: .delete) public var deletedAt: Date?
    
    public init() { }
    
    public init(
        id: ObjectId? = nil,
        member: User,
        admin: User,
        conversation: Conversation
    ) throws {
        self.id = id
        self.$member.id = try member.requireID()
        self.$admin.id = try admin.requireID()
        self.$conversation.id = try conversation.requireID()
    }
}

extension UserConversation {
    public func title(currentId: ObjectId) -> String {
        if conversation.type == .oneToOne {
            return member.id == currentId
            ? member.oneToOneConversastionTitle()
            : member.oneToOneConversastionTitle()
        } else {
            return conversation.title
        }
    }
}

#endif
