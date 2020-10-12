//
//  Event.swift
//  
//
//  Created by Saroar Khandoker on 12.10.2020.
//

import Foundation
import Vapor
import Fluent
import FluentMongoDriver

public final class Event: Model, Content {
    public static var schema = "events"

    public init() {}
    
    init(id: ObjectId? = nil, name: String, imageUrl: String? = nil, duration: Int, categories: String, isActive: Bool, ownerId: User.IDValue, conversationId: Conversation.IDValue) {
        self.id = id
        self.name = name
        self.imageUrl = imageUrl
        self.duration = duration
        self.categories = categories
        self.isActive = isActive
        self.$owner.id = ownerId
        self.$conversation.id = conversationId
    }
    
    @ID(custom: "id") public var id: ObjectId?
    @Field(key: "name") public var name: String
    @OptionalField(key: "imageUrl") public var imageUrl: String?
    @Field(key: "duration") public var duration: Int
    @Field(key: "categories") public var categories: String
    @Field(key: "isActive") public var isActive: Bool

    @Children(for: \.$event) public var geolocations: [GeoLocation]
    
    @Parent(key: "owner") public var owner: User
    @Parent(key: "conversation") public var conversation: Conversation
    
    @Timestamp(key: "createdAt", on: .create) public var createdAt: Date?
    @Timestamp(key: "updatedAt", on: .update) public var updatedAt: Date?
    @Timestamp(key: "deletedAt", on: .delete) public var deletedAt: Date?
    
}

public struct CUEvent: Content {
    var name: String
    var imageUrl: String?
    var duration: Int
    var categories: String
    var ownerId: ObjectId?
    var conversationId: ObjectId?
}
