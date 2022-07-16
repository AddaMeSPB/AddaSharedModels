//
//  Category.swift
//  
//
//  Created by Saroar Khandoker on 15.07.2022.
//

import Foundation
import Vapor
import Fluent
import FluentMongoDriver

public final class Category: Model, Content {

    public static var schema = "categories"
    public init() {}
    
    public init(
        id: ObjectId? = nil,
        name: String
    ) {
        self.id = id
        self.name = name
    }
    
    @ID(custom: "id") public var id: ObjectId?
    @Field(key: "name") public var name: String
    @Children(for: \.$category) public var events: [Event]
    
    @Timestamp(key: "createdAt", on: .create) public var createdAt: Date?
    @Timestamp(key: "updatedAt", on: .update) public var updatedAt: Date?
    @Timestamp(key: "deletedAt", on: .delete) public var deletedAt: Date?
}
