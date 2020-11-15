//
//  Contact.swift
//  
//
//  Created by Saroar Khandoker on 12.11.2020.
//

import Vapor
import Fluent
import FluentMongoDriver

public final class Contact: Model, Content {
  
  public static var schema = "contacts"
  
  public init() {}
  
  public init(id: ObjectId? = nil, phoneNumber: String, identifier: String, fullName: String? = nil, avatar: String? = nil, isRegister: Bool? = false, userId: User.IDValue) {
    self.id = id
    self.phoneNumber = phoneNumber
    self.identifier = identifier
    self.avatar = avatar
    self.fullName = fullName
    self.isRegister = isRegister
    self.$user.id = userId
  }
  
  @ID(custom: "id") public var id: ObjectId?
  @Field(key: "phoneNumber") public var phoneNumber: String
  @Field(key: "identifier") public var identifier: String
  @Field(key: "fullName") public var fullName: String?
  @Field(key: "avatar") public var avatar: String?
  @Field(key: "isRegister") public var isRegister: Bool?
  @Parent(key: "userId") public var user: User
  @Timestamp(key: "createdAt", on: .create) public var createdAt: Date?
  @Timestamp(key: "updatedAt", on: .update) public var updatedAt: Date?
  @Timestamp(key: "deletedAt", on: .delete) public var deletedAt: Date?

  public var response: ReqRes {
      .init(self)
  }
  
  public struct ReqRes: Content {
    internal init(_ contact: Contact) {
      self.id = contact.id
      self.identifier = contact.identifier
      self.phoneNumber = contact.phoneNumber
      self.fullName = contact.fullName
      self.avatar = contact.avatar
      self.isRegister = contact.isRegister
      self.userId = contact.$user.id
    }
    
      public var id: ObjectId?
      public var identifier: String?
      public var phoneNumber: String
      public var fullName: String?
      public var avatar: String?
      public var isRegister: Bool?
      public var userId: ObjectId
    
  }
  
}

extension Contact: Hashable {
  public func hash(into hasher: inout Hasher) {
    hasher.combine(phoneNumber)
  }
  
  public static func ==(lhs: Contact, rhs: Contact) -> Bool {
    return lhs.phoneNumber == rhs.phoneNumber
  }
}

extension Contact.ReqRes: Hashable {
  public func hash(into hasher: inout Hasher) {
    hasher.combine(phoneNumber)
  }
  
  public static func ==(lhs: Contact.ReqRes, rhs: Contact.ReqRes) -> Bool {
    return lhs.phoneNumber == rhs.phoneNumber
  }
}
