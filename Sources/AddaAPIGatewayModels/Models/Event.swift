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
    
    public init(id: ObjectId? = nil, name: String, imageUrl: String? = nil, duration: Int, categories: String, isActive: Bool, ownerId: User.IDValue, conversationId: Conversation.IDValue) {
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
    
    @Parent(key: "ownerId") public var owner: User
    @Parent(key: "conversationId") public var conversation: Conversation
    
    @Timestamp(key: "createdAt", on: .create) public var createdAt: Date?
    @Timestamp(key: "updatedAt", on: .update) public var updatedAt: Date?
    @Timestamp(key: "deletedAt", on: .delete) public var deletedAt: Date?
    
}

extension Event {
    
    public var response: Item {
        .init(self)
    }
    
    public struct Item: Content {
        public init(_ event: Event) {
            self.id = event.id
            self.name = event.name
            self.imageUrl = event.imageUrl
            self.duration = event.duration
            self.categories = event.categories
            self.owner = event.owner
            self.conversation = event.conversation
            self.geoLocations = event.geolocations
            self.isActive = event.isActive
            self.createdAt = event.createdAt
            self.updatedAt = event.updatedAt
            self.deletedAt = event.deletedAt
        }
        
        
        public var id: ObjectId?
        public var name: String
        public var imageUrl: String?
        public var duration: Int
        public var categories: String
        public var geoLocations: [GeoLocation]
        public var owner: User?
        public var conversation: Conversation?
        public var isActive: Bool
        public let updatedAt, createdAt, deletedAt: Date?
    }
}

public struct CUEvent: Content {
    public var name: String
    public var imageUrl: String?
    public var duration: Int
    public var categories: String
    public var ownerId: ObjectId?
    public var conversationId: ObjectId?
    public var isActive: Bool
}

