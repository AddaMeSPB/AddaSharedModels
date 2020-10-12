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

final class Event: Model, Content {
    static var schema = "events"

    init() {}
    
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
    
    @ID(custom: "id") var id: ObjectId?
    @Field(key: "name") var name: String
    @OptionalField(key: "imageUrl") var imageUrl: String?
    @Field(key: "duration") var duration: Int
    @Field(key: "categories") var categories: String
    @Field(key: "isActive") var isActive: Bool

    @Children(for: \.$event) var geolocations: [GeoLocation]
    
    @Parent(key: "owner") var owner: User
    @Parent(key: "conversation") var conversation: Conversation
    
    @Timestamp(key: "createdAt", on: .create) var createdAt: Date?
    @Timestamp(key: "updatedAt", on: .update) var updatedAt: Date?
    @Timestamp(key: "deletedAt", on: .delete) var deletedAt: Date?
    
}
