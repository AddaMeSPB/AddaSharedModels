//
//  BlockList.swift
//  
//
//  Created by Saroar Khandoker on 24.09.2020.
//

import Foundation
import BSON

public struct BlockListInoutPut: Codable {
    public init(id: ObjectId? = nil , userID: ObjectId, blockUserIDs: Set<[ObjectId]>, createdAt: Date? = nil, updatedAt: Date? = nil, deletedAt: Date? = nil) {
        self.id = id
        self.userID = userID
        self.blockUserIDs = blockUserIDs
        self.createdAt = createdAt
        self.updatedAt = updatedAt
        self.deletedAt = deletedAt
    }
    
    public var id: ObjectId?
    public var userID: ObjectId
    public var blockUserIDs: Set<[ObjectId]>
    public var createdAt: Date?
    public var updatedAt: Date?
    public var deletedAt: Date?
}

