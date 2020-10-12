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

final class BlockList: Model {
    
    static var schema = "block_lists"
    
    init() {}
    
    init(id: ObjectId?, ownerID: ObjectId, blockUserIDs: Set<[ObjectId]>) {
        self.id = id
        self.ownerID = ownerID
        self.blockUserIDs = blockUserIDs
    }
    
    @ID(custom: "id") var id: ObjectId?
    @Field(key: "ownerId") var ownerID: ObjectId
    @Field(key: "blockUserIds") var blockUserIDs: Set<[ObjectId]>

    @Timestamp(key: "createdAt", on: .create) var createdAt: Date?
    @Timestamp(key: "updatedAt", on: .update) var updatedAt: Date?
    @Timestamp(key: "deletedAt", on: .delete) var deletedAt: Date?
    
}

extension BlockList: Content {
    var response: Res {
       .init(self)
    }
    
    struct Res: Codable {
        init(_ blockList: BlockList) {
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
        
            
        var id: String
        var userID: ObjectId
        var blockUserIDs: Set<[ObjectId]>
        var createdAt: Date?
        var updatedAt: Date?
        var deletedAt: Date?
    }
}
