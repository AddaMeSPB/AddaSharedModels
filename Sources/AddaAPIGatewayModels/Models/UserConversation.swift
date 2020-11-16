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

public final class UserConversation: Model {
  public static let schema = "user_conversation_pivot"
  
  @ID(custom: "id") public var id: ObjectId?
  
  //@Parent(key: "user_id") var user: User
  @Parent(key: "memberId") public var member: User
  @Parent(key: "adminId") public var admin: User
  @Parent(key: "conversationId")  public var conversation: Conversation
  
  public init() { }
  
  public init(id: ObjectId? = nil, member: User, admin: User, conversation: Conversation) throws {
    self.id = id
    self.$member.id = try member.requireID()
    self.$admin.id = try admin.requireID()
    self.$conversation.id = try conversation.requireID()
  }
}
