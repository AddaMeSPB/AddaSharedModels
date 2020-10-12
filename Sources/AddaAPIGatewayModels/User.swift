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

final class User: Model, Content, Hashable {

    static var schema = "users"

    init() {}
    
    @ID(custom: "id") var id: ObjectId?
    @Field(key: "phoneNumber") var phoneNumber: String
    
    @OptionalField(key: "firstName") var firstName: String?
    @OptionalField(key: "lastName") var lastName: String?
    @OptionalField(key: "email") var email: String?
    
    @Children(for: \.$owner) var event: [Event]
    @Children(for: \.$sender) var sender: [Message]
    @Children(for: \.$recipient) var recipient: [Message]

    @Siblings(through: UserConversation.self, from: \.$member, to: \.$conversation)
    public var members: [Conversation]

    @Siblings(through: UserConversation.self, from: \.$admin, to: \.$conversation)
    public var admins: [Conversation]

    @Timestamp(key: "createdAt", on: .create) var createdAt: Date?
    @Timestamp(key: "updatedAt", on: .update) var updatedAt: Date?
    @Timestamp(key: "deletedAt", on: .delete) var deletedAt: Date?
    
    func hash(into hasher: inout Hasher) {
        hasher.combine(id)
    }
    
    static func == (lhs: User, rhs: User) -> Bool {
        lhs.id == rhs.id
    }
}

extension User {
    var response: Response {
        .init(self)
    }
    
    struct Response: Content {
        
        init(_ user: User) {
    
            if user.id == nil {
                self.id = ObjectId()
            } else {
                self.id = user.id
            }
            
            self.firstName = user.firstName
            self.lastName = user.lastName
            self.email = user.email
            self.phoneNumber = user.phoneNumber
            
            self.createdAt = user.createdAt
            self.updatedAt = user.updatedAt
            self.deletedAt = user.deletedAt
        }
        
        var id: ObjectId?
        var firstName, lastName, email: String?
        var phoneNumber: String
        var createdAt, updatedAt, deletedAt: Date?
    }
}


