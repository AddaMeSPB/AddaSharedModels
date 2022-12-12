//
//  User.swift
//  
//
//  Created by Saroar Khandoker on 12.10.2020.
//

import Foundation
import BSON

/// Dont have any role and language Need to combine with UserGetObject
public struct UserOutput: Codable, Identifiable {

    public var id: ObjectId
    public var fullName, phoneNumber, email: String?
    public var role: UserRole
    public var language: UserLanguage

    // User Device lists
    public var devices: [DeviceInOutPut]?

    // User Hangout events
    public var hangouts: [EventResponse]?

    // Attachments Photo,Video, etc url
    public var attachments: [AttachmentInOutPut]?

    /// Admins Conversations list
    public var adminsConversations: [ConversationOutPut]?

    /// MembersConversaions list
    public var membersConversaions: [ConversationOutPut]?

    /// Date
    public var createdAt, updatedAt, deletedAt: Date?

    public var url: URL

    /// Init
    /// - Parameters:
    ///   - id: ObjectId(mongodb ID)  are similar to a GUID or a UUID, and can be used to uniquely identify objects without a centralized
    ///   - fullName: String combine Firstname + Lastname
    ///   - email: Email
    ///   - phoneNumber: phoneNumber
    ///   - attachments: attachments for images
    ///   - adminsConversations: admins Conversations list
    ///   - membersConversaions: membersConversaions list
    ///   - url: url description
    ///   - createdAt: createdAt its Date
    ///   - updatedAt: updatedAt its Date
    ///   - deletedAt: deletedAt Date
    public init(
        id: ObjectId,
        fullName: String? = nil,
        email: String? = nil,
        phoneNumber: String? = nil,
        role: UserRole,
        language: UserLanguage,
        devices: [DeviceInOutPut]? = nil,
        hangouts: [EventResponse]? = nil,
        attachments: [AttachmentInOutPut]? = nil,
        adminsConversations: [ConversationOutPut]? = nil,
        membersConversaions: [ConversationOutPut]? = nil,
        url: URL,
        createdAt: Date? = nil,
        updatedAt: Date? = nil,
        deletedAt: Date? = nil
    ) {
        self.id = id
        self.fullName = fullName
        self.email = email
        self.phoneNumber = phoneNumber
        self.role = role
        self.language = language
        self.devices = devices
        self.hangouts = hangouts
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

extension UserOutput: Equatable, Hashable {

    public func hash(into hasher: inout Hasher) {
      hasher.combine(id)
    }

    public static func == (lhs: UserOutput, rhs: UserOutput) -> Bool {
      return
        lhs.id == rhs.id && lhs.email == rhs.email
        && lhs.fullName == rhs.fullName
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
