//
//  Contact.swift
//  
//
//  Created by Saroar Khandoker on 12.11.2020.
//

import BSON

public struct MobileNumbersInput: Codable {

    public var mobileNumber: [String]

    public init(mobileNumber: [String]) {
        self.mobileNumber = mobileNumber
    }
    
}

extension MobileNumbersInput: Equatable {}
extension MobileNumbersInput: Hashable {}

public struct ContactInPut: Codable {
    public var userId: ObjectId
    public var identifier: String?
    public var phoneNumber: String
    public var fullName: String?
    public var avatar: String?
    public var isRegister: Bool?
    
    public init(
        userId: ObjectId,
        identifier: String? = nil,
        phoneNumber: String,
        fullName: String? = nil,
        avatar: String? = nil,
        isRegister: Bool? = nil
    ) {
        self.userId = userId
        self.identifier = identifier
        self.phoneNumber = phoneNumber
        self.fullName = fullName
        self.avatar = avatar
        self.isRegister = isRegister
    }
}

extension ContactInPut: Equatable {
    public func hash(into hasher: inout Hasher) {
      hasher.combine(phoneNumber)
      hasher.combine(isRegister)
    }

    public static func == (lhs: ContactInPut, rhs: ContactInPut) -> Bool {
        return lhs.phoneNumber == rhs.phoneNumber
        && lhs.isRegister == rhs.isRegister
    }
}

public struct ContactOutPut: Identifiable {
    public var id: ObjectId
    public var userId: ObjectId
    public var identifier: String?
    public var phoneNumber: String
    public var fullName: String?
    public var avatar: String?
    public var isRegister: Bool?
    
    public init(
        id: ObjectId,
        userId: ObjectId,
        identifier: String? = nil,
        phoneNumber: String,
        fullName: String? = nil,
        avatar: String? = nil,
        isRegister: Bool? = nil
    ) {
        self.id = id
        self.userId = userId
        self.identifier = identifier
        self.phoneNumber = phoneNumber
        self.fullName = fullName
        self.avatar = avatar
        self.isRegister = isRegister
    }

}

extension ContactOutPut: Hashable {
  public func hash(into hasher: inout Hasher) {
    hasher.combine(phoneNumber)
    hasher.combine(isRegister)
  }
  
  public static func ==(lhs: ContactOutPut, rhs: ContactOutPut) -> Bool {
      return lhs.id == rhs.id
      && lhs.phoneNumber == rhs.phoneNumber
      && lhs.isRegister == rhs.isRegister
  }
}

extension ContactOutPut: Codable {}
extension ContactOutPut: Equatable {}

public struct CreateContact: Codable {
  public var items: [ContactOutPut]
}
