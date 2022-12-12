//
//  Message.swift
//  
//
//  Created by Saroar Khandoker on 02.10.2020.
//

import Foundation
import BSON


/// Message Output
/// - public var id: ObjectId? = nil
/// - public var conversationId: ObjectId
/// - public var messageBody: String
/// - public var messageType: MessageType
/// - public var isRead: Bool? = nil
/// - public var isDelivered: Bool? = nil
/// - public var sender: UserOutput? = nil
/// - public var recipient: UserOutput? = nil
/// - public var createdAt: Date? = nil
/// - public var updatedAt: Date? = nil
/// - public var deletedAt: Date? = nil
public struct MessageItem: Identifiable {

    public var id: ObjectId
    public var conversationId: ObjectId
    public var messageBody: String
    public var messageType: MessageType
    public var isRead: Bool?
    public var isDelivered: Bool?
    public var sender: UserOutput?
    public var recipient: UserOutput?
    public var createdAt: Date?
    public var updatedAt: Date?
    public var deletedAt: Date?

    
    /// INIT
    /// - Parameters:
    ///   - id: ObjectId
    ///   - conversationId: ObjectId
    ///   - messageBody: messageBody description
    ///   - messageType: messageType description
    ///   - isRead: isRead description
    ///   - isDelivered: isDelivered description
    ///   - sender: sender description
    ///   - recipient: recipient description
    ///   - createdAt: createdAt description
    ///   - updatedAt: updatedAt description
    ///   - deletedAt: deletedAt description
    public init(
        id: ObjectId,
        conversationId: ObjectId,
        messageBody: String,
        messageType: MessageType,
        isRead: Bool?,
        isDelivered: Bool?,
        sender: UserOutput?,
        recipient: UserOutput?,
        createdAt: Date?,
        updatedAt: Date?,
        deletedAt: Date?
    ) {
        self.id = id
        self.conversationId = conversationId
        self.messageBody = messageBody
        self.messageType = messageType
        self.isRead = isRead
        self.isDelivered = isDelivered
        self.sender = sender
        self.recipient = recipient
        self.createdAt = createdAt
        self.updatedAt = updatedAt
        self.deletedAt = deletedAt
    }
    
}

extension MessageItem: Codable  {}
extension MessageItem: Hashable  {}
extension MessageItem: Comparable  {}
extension MessageItem: Equatable  {}

extension MessageItem {
    public func hash(into hasher: inout Hasher) {
        hasher.combine(id)
        hasher.combine(messageBody)
        hasher.combine(conversationId)
        hasher.combine(isRead)
    }

    public static func == (lhs: MessageItem, rhs: MessageItem) -> Bool {
        return lhs.id == rhs.id
        && lhs.messageBody == rhs.messageBody
        && lhs.conversationId == rhs.conversationId
        && lhs.isRead == rhs.isRead
    }
    
    public static func < (lhs: MessageItem, rhs: MessageItem) -> Bool {
      guard let lhsDate = lhs.createdAt, let rhsDate = rhs.createdAt else { return false }
      return lhsDate > rhsDate && lhs.id == rhs.id
        && lhs.messageBody == rhs.messageBody
        && lhs.conversationId == rhs.conversationId
        && lhs.isRead == rhs.isRead
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
