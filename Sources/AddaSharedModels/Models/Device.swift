//
//  File.swift
//  
//
//  Created by Saroar Khandoker on 29.11.2020.
//

import Foundation
import Vapor
import Fluent
import FluentMongoDriver


// `type` ENUM('APPLE') NOT NULL
public final class Device: Model, Content {
  
  public static var schema = "devices"
  
  public init() {}
  
  public init(id: ObjectId? = nil, name: String, model: String? = nil, osVersion: String? = nil, token: String, voipToken: String, userId: User.IDValue) {
    self.id = id
    self.name = name
    self.model = model
    self.osVersion = osVersion
    self.token = token
    self.voipToken = voipToken
    self.$user.id = userId
  }
  
  @ID(custom: "id") public var id: ObjectId?

  @Field(key: "name") public var name: String
  @OptionalField(key: "model") public var model: String?
  @OptionalField(key: "osVersion") public var osVersion: String?
  @Field(key: "token") public var token: String
  @Field(key: "voipToken") public var voipToken: String

  @Parent(key: "ownerId") public var user: User
  
  @Timestamp(key: "createdAt", on: .create) public var createdAt: Date?
  @Timestamp(key: "updatedAt", on: .update) public var updatedAt: Date?
  @Timestamp(key: "deletedAt", on: .delete) public var deletedAt: Date?
  
  public var res: RequestResponse {
    .init(self)
  }
  
  public struct RequestResponse: Content {
    public init(id: ObjectId? = nil, ownerId: ObjectId, name: String, model: String? = nil, osVersion: String? = nil, token: String, voipToken: String, createdAt: Date? = nil, updatedAt: Date? = nil) {
      self._id = id
      self.ownerId = ownerId
      self.name = name
      self.model = model
      self.osVersion = osVersion
      self.token = token
      self.voipToken = voipToken
      self.createdAt = createdAt
      self.updatedAt = updatedAt
    }
    
    public init(_ device: Device) {
      self._id = device.id
      self.ownerId = device.$user.id
      self.name = device.name
      self.model = device.model
      self.osVersion = device.osVersion
      self.token = device.token
      self.voipToken = device.voipToken
      self.createdAt = device.createdAt
      self.updatedAt = device.updatedAt
      self.deletedAt = device.deletedAt
    }
    
    public var _id: ObjectId?
    public var ownerId: ObjectId
    public var name: String
    public var model: String?
    public var osVersion: String?
    public var token: String
    public var voipToken: String
    public var createdAt, updatedAt, deletedAt: Date?
  }
}
