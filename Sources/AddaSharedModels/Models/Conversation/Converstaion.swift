//
//  Conversation.swift
//  
//
//  Created by Saroar Khandoker on 25.09.2020.
//

import Foundation
import MongoKitten

public enum ConversationType: String, Codable {
    case oneToOne, group
}

public struct ConversationOutPut: Codable {
    public init(
        id: ObjectId?,
        title: String,
        type: ConversationType,
        admins: [UserOutput],
        members: [UserOutput],
        lastMessage: MessageItem?,
        createdAt: Date? = nil,
        updatedAt: Date? = nil,
        deletedAt: Date? = nil
    ) {
        self.id = id
        self.title = title
        self.type = type
        self.admins = admins
        self.members = members
        self.lastMessage = lastMessage
        self.createdAt = createdAt
        self.updatedAt = updatedAt
        self.deletedAt = deletedAt
    }
    
    public let id: ObjectId?
    public let title: String
    public let type: ConversationType
    public let admins: [UserOutput]
    public let members: [UserOutput]
    public let lastMessage: MessageItem?
    public let createdAt, updatedAt, deletedAt: Date?
}

extension ConversationOutPut: Hashable, Identifiable {
    public func hash(into hasher: inout Hasher) {
        hasher.combine(id)
    }
    
    public static func == (lhs: ConversationOutPut, rhs: ConversationOutPut) -> Bool {
        lhs.id == rhs.id
    }
    
    public static func < (lhs: ConversationOutPut, rhs: ConversationOutPut) -> Bool {
        guard let lhsLstMsg = lhs.lastMessage, let rhsLstMsg = rhs.lastMessage,
              let lhsDate = lhsLstMsg.updatedAt, let rhsDate = rhsLstMsg.updatedAt
        else { return false }
        return lhsDate > rhsDate
    }
}

public struct CreateConversation: Codable, Equatable {
    public let title: String
    public let type: ConversationType
    public let opponentPhoneNumber: String
    
    public init(
        title: String,
        type: ConversationType,
        opponentPhoneNumber: String
    ) {
        self.title = title
        self.type = type
        self.opponentPhoneNumber = opponentPhoneNumber
    }
}

public struct AddUser: Codable {
    public let conversationsId: String
    public let usersId: String
    
    public init(conversationsId: String, usersId: String) {
        self.conversationsId = conversationsId
        self.usersId = usersId
    }
}

public struct ConversationPage: Codable, Equatable {
    public let items: [ConversationOutPut]
    public let metadata: Metadata
    
    public init(items: [ConversationOutPut], metadata: Metadata) {
        self.items = items
        self.metadata = metadata
    }
}
