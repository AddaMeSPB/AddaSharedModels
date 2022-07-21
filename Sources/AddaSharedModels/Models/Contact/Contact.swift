//
//  Contact.swift
//  
//
//  Created by Saroar Khandoker on 12.11.2020.
//

import MongoKitten

public struct ContactInOutPut: Codable {
    public init(
        id: ObjectId? = nil,
        identifier: String? = nil,
        phoneNumber: String,
        fullName: String? = nil,
        avatar: String? = nil,
        isRegister: Bool? = nil,
        userId: ObjectId
    ) {
        self.id = id
        self.identifier = identifier
        self.phoneNumber = phoneNumber
        self.fullName = fullName
        self.avatar = avatar
        self.isRegister = isRegister
        self.userId = userId
    }
    
  public var id: ObjectId?
  public var identifier: String?
  public var phoneNumber: String
  public var fullName: String?
  public var avatar: String?
  public var isRegister: Bool?
  public var userId: ObjectId
}

extension ContactInOutPut: Hashable {
  public func hash(into hasher: inout Hasher) {
    hasher.combine(phoneNumber)
    hasher.combine(isRegister)
  }
  
  public static func ==(lhs: ContactInOutPut, rhs: ContactInOutPut) -> Bool {
      return lhs.id == rhs.id
      && lhs.phoneNumber == rhs.phoneNumber
      && lhs.isRegister == rhs.isRegister
  }
}

public struct CreateContact: Codable {
  public var items: [ContactInOutPut]
}
