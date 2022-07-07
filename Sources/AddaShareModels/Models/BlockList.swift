//
//  BlockList.swift
//  
//
//  Created by Saroar Khandoker on 24.09.2020.
//

import Foundation
import Vapor
import Fluent
import FluentMongoDriver

public final class BlockList: Model {
  
  public static var schema = "block_lists"
  
  public init() {}
  
  public init(id: ObjectId?, ownerID: ObjectId, blockUserIDs: Set<[ObjectId]>) {
    self.id = id
    self.ownerID = ownerID
    self.blockUserIDs = blockUserIDs
  }
  
  @ID(custom: "id") public var id: ObjectId?
  @Field(key: "ownerId") public var ownerID: ObjectId
  @Field(key: "blockUserIds") public var blockUserIDs: Set<[ObjectId]>
  
  @Timestamp(key: "createdAt", on: .create) public var createdAt: Date?
  @Timestamp(key: "updatedAt", on: .update) public var updatedAt: Date?
  @Timestamp(key: "deletedAt", on: .delete) public var deletedAt: Date?
  
}

extension BlockList: Content {
  public var response: Res {
    .init(self)
  }
  
  public struct Res: Codable {
    public init(_ blockList: BlockList) {
      if blockList.id == nil {
        self.id = ObjectId().hexString
      } else {
        self.id = blockList.id!.hexString
      }
      
      self.userID = blockList.ownerID
      self.blockUserIDs = blockList.blockUserIDs
      self.createdAt = blockList.createdAt
      self.updatedAt = blockList.updatedAt
    }
    
    
    public var id: String
    public var userID: ObjectId
    public var blockUserIDs: Set<[ObjectId]>
    public var createdAt: Date?
    public var updatedAt: Date?
    public var deletedAt: Date?
  }
}
