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

public enum ConversationType: String, Codable {
  case oneToOne, group
}

public final class Conversation: Model, Content {
  
  public static var schema = "conversations"
  
  public init() {}
  
  public init(title: String, type: ConversationType) {
    self.title = title
    self.type = type
  }
  
  @ID(custom: "id") public var id: ObjectId?
  @Field(key: "title") public var title: String
  @Field(key: "type") public var type: ConversationType
  
  @Children(for: \.$conversation) public var events: [Event]
  @Children(for: \.$conversation) public var messages: [Message]
  
  @Siblings(through: UserConversation.self, from: \.$conversation, to: \.$member)
  public var members: [User]
  
  @Siblings(through: UserConversation.self, from: \.$conversation, to: \.$admin)
  public var admins: [User]
  
  @Timestamp(key: "createdAt", on: .create) public var createdAt: Date?
  @Timestamp(key: "updatedAt", on: .update) public var updatedAt: Date?
  @Timestamp(key: "deletedAt", on: .delete) public var deletedAt: Date?
  
  public func addUserAsAMemberAndAdmin(userId: ObjectId, req: Request) {
    User.find(userId, on: req.db)
      .unwrap(or: Abort(.notFound, reason: "Cant find member or admin user") )
      .flatMap { user in
        self.$admins.attach(user, method: .ifNotExists, on: req.db).flatMap {
          self.$members.attach(user, method: .ifNotExists, on: req.db)
        }
      }
  }
  
  public func addUserAsAMember(userId: ObjectId, req: Request) {
    User.find(userId, on: req.db)
      .unwrap(or: Abort(.notFound, reason: "Cant find member user") )
      .map { self.$members.attach($0, method: .ifNotExists, on: req.db) }
  }
  
  public func addUserAsAAdmin(adminUserID: ObjectId, req: Request) {
    User.find(adminUserID, on: req.db)
      .unwrap(or: Abort(.notFound, reason: "Cant find member user") )
      .map { self.$admins.attach($0, method: .ifNotExists, on: req.db) }
  }
  
  public func addMemberToOneToOneConversationBy(phoneNumber: String, req: Request) {
    User.query(on: req.db)
        .filter(\.$phoneNumber == phoneNumber)
        .first()
        .unwrap(or: Abort(.notFound, reason: "Cant find member user") )
        .map { self.$members.attach($0, method: .ifNotExists, on: req.db) }
  }

}

public struct ConversationWithKids: Content {
  public init(id: ObjectId?, title: String, type: ConversationType, admins: [User], members: [User], lastMessage: Message.Item?, createdAt: Date, updatedAt: Date) {
    self.id = id
    self.title = title
    self.type = type
    self.admins = admins
    self.members = members
    self.lastMessage = lastMessage
    self.createdAt = createdAt
    self.updatedAt = updatedAt
  }
  
  public let id: ObjectId?
  public let title: String
  public let type: ConversationType
  public let admins: [User]
  public let members: [User]
  public let lastMessage: Message.Item?
  public let createdAt, updatedAt: Date?
}

public struct CreateConversation: Content {
  public let title: String
  public let type: ConversationType
  public let opponentPhoneNumber: String
}
