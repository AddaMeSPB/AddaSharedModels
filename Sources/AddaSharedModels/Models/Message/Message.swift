//
//  Message.swift
//  
//
//  Created by Saroar Khandoker on 02.10.2020.
//

import Foundation
import MongoKitten
  
public struct MessageItem: Codable, Hashable, Identifiable, Comparable, Equatable {
    public init(
        id: ObjectId?,
        messageBody: String,
        messageType: MessageType,
        isRead: Bool, isDelivered: Bool,
        sender: UserOutput?,
        recipient: UserOutput?,
        conversationId: ObjectId,
        createdAt: Date?,
        updatedAt: Date?,
        deletedAt: Date?
    ) {
        self.id = id
        self.messageBody = messageBody
        self.messageType = messageType
        self.isRead = isRead
        self.isDelivered = isDelivered
        self.sender = sender
        self.recipient = recipient
        self.conversationId = conversationId
        
        self.createdAt = createdAt
        self.updatedAt = updatedAt
        self.deletedAt = deletedAt
    }
        
    public let id: ObjectId?
    public let messageBody: String
    public let messageType: MessageType
    public let isRead, isDelivered: Bool
    public let sender: UserOutput?
    public let recipient: UserOutput?
    public let conversationId: ObjectId
    public let createdAt, updatedAt, deletedAt: Date?
    
}

extension MessageItem {
    public func hash(into hasher: inout Hasher) {
      hasher.combine(id)
      hasher.combine(messageBody)
    }

    public static func == (lhs: MessageItem, rhs: MessageItem) -> Bool {
        return lhs.id == rhs.id
        && lhs.messageBody == rhs.messageBody
        && lhs.conversationId == rhs.conversationId
        && lhs.isRead == rhs.isRead
    }
    
    public static func < (lhs: MessageItem, rhs: MessageItem) -> Bool {
      guard let lhsDate = lhs.createdAt, let rhsDate = rhs.createdAt else { return false }
      return lhsDate > rhsDate
    }
}

public struct MessagePage: Codable, Equatable {
  public let items: [MessageItem]
  public let metadata: Metadata

  public init(items: [MessageItem], metadata: Metadata) {
    self.items = items
    self.metadata = metadata
  }
}

public struct LastMessage: Codable, Identifiable {
  public var id, senderID: String
  public var phoneNumber: String
  public var firstName, lastName: String?
  public var avatar, messageBody: String
  public var totalUnreadMessages: Int
  public var timestamp: Int

  public enum CodingKeys: String, CodingKey {
    case senderID = "sender_id"
    case phoneNumber = "phone_number"
    case firstName = "first_name"
    case lastName = "last_name"
    case messageBody = "message_body"
    case totalUnreadMessages = "total_unread_messages"
    case id, avatar, timestamp
  }
}

extension LastMessage: Hashable {
  public func hash(into hasher: inout Hasher) {
    hasher.combine(id)
    hasher.combine(phoneNumber)
  }
}
