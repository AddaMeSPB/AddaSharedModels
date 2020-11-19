//
//  User.swift
//  
//
//  Created by Saroar Khandoker on 12.10.2020.
//

import Foundation
import Vapor
import Fluent
import FluentMongoDriver

public final class User: Model, Content, Hashable {
  
  public static var schema = "users"
  
  public init() {}
  
  public init(id: ObjectId? = nil, phoneNumber: String, firstName: String? = nil, lastName: String? = nil, avatar: String? = "", email: String? = nil) {
    self.id = id
    self.phoneNumber = phoneNumber
    self.firstName = firstName
    self.lastName = lastName
    self.avatar = avatar
    self.email = email
  }
  
  @ID(custom: "id") public var id: ObjectId?
  @Field(key: "phoneNumber") public var phoneNumber: String
  
  @OptionalField(key: "firstName") public var firstName: String?
  @OptionalField(key: "lastName") public var lastName: String?
  @OptionalField(key: "avatar") public var avatar: String?
  @OptionalField(key: "email") public var email: String?
  
  @Children(for: \.$owner) public var events: [Event]
  @Children(for: \.$sender) public var senders: [Message]
  @Children(for: \.$recipient) public var recipients: [Message]
  @Children(for: \.$user) public var contacts: [Contact]
  
  @Children(for: \.$user) public var attachments: [Attachment]
  
  @Siblings(through: UserConversation.self, from: \.$member, to: \.$conversation)
  public var memberConversaions: [Conversation]
  
  @Siblings(through: UserConversation.self, from: \.$admin, to: \.$conversation)
  public var adminConversations: [Conversation]
  
  @Timestamp(key: "createdAt", on: .create) public var createdAt: Date?
  @Timestamp(key: "updatedAt", on: .update) public var updatedAt: Date?
  @Timestamp(key: "deletedAt", on: .delete) public var deletedAt: Date?
  
  public func hash(into hasher: inout Hasher) {
    hasher.combine(id)
  }
  
  public static func == (lhs: User, rhs: User) -> Bool {
    lhs.id == rhs.id
  }
}

extension User {
  
  public var amConversations: [Conversation] {
    return self.adminConversations + self.memberConversaions
  }
  
  public var response: Response {
    .init(self)
  }
  
  public struct Response: Content {
    
    public init(_ user: User) {
      self.id = user.id
      self.firstName = user.firstName
      self.lastName = user.lastName
      self.avatar = user.avatar
      self.email = user.email
      self.phoneNumber = user.phoneNumber
      
      self.createdAt = user.createdAt
      self.updatedAt = user.updatedAt
      self.deletedAt = user.deletedAt
    }
    
    public var id: ObjectId?
    public var firstName, lastName, email, avatar: String?
    public var phoneNumber: String
    public var adminsConversations: [Conversation]?
    public var membersConversaions: [Conversation]?
    public var createdAt, updatedAt, deletedAt: Date?
  }
}


