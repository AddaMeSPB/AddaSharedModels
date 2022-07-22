//
//  User.swift
//  
//
//  Created by Saroar Khandoker on 12.10.2020.
//

import Foundation
import BSON

public struct UserOutput: Codable, Equatable, Hashable, Identifiable {
    
    public var id: ObjectId?
    public var firstName, lastName, email: String?
    public var phoneNumber: String
    public var attachments: [AttachmentInOutPut]?
    public var adminsConversations: [ConversationOutPut]?
    public var membersConversaions: [ConversationOutPut]?
    public var createdAt, updatedAt, deletedAt: Date?
    public var url: URL
    
    public init(
        id: ObjectId? = nil,
        firstName: String? = nil,
        lastName: String? = nil,
        email: String? = nil,
        phoneNumber: String,
        attachments: [AttachmentInOutPut]? = nil,
        adminsConversations: [ConversationOutPut]? = nil,
        membersConversaions: [ConversationOutPut]? = nil,
        url: URL,
        createdAt: Date? = nil,
        updatedAt: Date? = nil,
        deletedAt: Date? = nil
    ) {
        self.id = id
        self.firstName = firstName
        self.lastName = lastName
        self.email = email
        self.phoneNumber = phoneNumber
        self.attachments = attachments
        self.adminsConversations = adminsConversations
        self.membersConversaions = membersConversaions
        self.url = url
        self.createdAt = createdAt
        self.updatedAt = updatedAt
        self.deletedAt = deletedAt
    }
    
}

extension UserOutput {
//    public static var draff: Self {
//      .init(
//        id: ObjectId(), phoneNumber: "+79212121211",
//        avatarUrl: nil, firstName: "1st Draff",
//        lastName: "2nd Draff", email: nil,
//        contactIDs: nil, deviceIDs: nil, attachments: nil,
//        createdAt: Date(), updatedAt: Date()
//      )
//    }
}

extension UserOutput {
    public var fullName: String {
      var fullName = ""
      if let firstN = firstName {
        fullName += "\(firstN) "
      }

      if let lastN = lastName {
        fullName += "\(lastN)"
      }

      if fullName.isEmpty {
        return phoneNumber
      }

      return fullName
    }

//    public func hideLast4DigitFromPhoneNumber() -> String {
//      guard let user: User = KeychainService.loadCodable(for: .user) else {
//        return "SwiftUI preview missing User"
//      }
//
//      let lastFourCharacters = String(phoneNumber.suffix(4))
//      let phoneNumWithLastFourHiddenCharcters = phoneNumber.replace(
//        target: lastFourCharacters, withString: "****")
//
//      return self.id == id ? phoneNumber : phoneNumWithLastFourHiddenCharcters
//    }

    public func hash(into hasher: inout Hasher) {
      hasher.combine(id)
    }

    public static func == (lhs: UserOutput, rhs: UserOutput) -> Bool {
      return
        lhs.id == rhs.id && lhs.phoneNumber == rhs.phoneNumber
        && lhs.firstName == rhs.firstName && lhs.lastName == rhs.lastName && lhs.email == rhs.email
    }
}

extension UserOutput {
  public var lastAvatarURLString: String? {
    guard let atchmts = attachments else {
      return nil
    }
    print(#line, atchmts)
    return atchmts.filter { $0.type == .image }.last?.imageUrlString
  }

  public var imageURL: URL? {
    guard let lastAvatarURLS = lastAvatarURLString else {
      return nil
    }

    return URL(string: lastAvatarURLS)!
  }
}
