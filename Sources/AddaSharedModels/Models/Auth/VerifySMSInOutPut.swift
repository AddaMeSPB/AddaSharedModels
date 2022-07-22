//
//  VerifySMSInput.swift
//  
//
//  Created by Alif on 7/6/20.
//

#if os(macOS) || os(Linux)
import Vapor

extension VerifySMSInOutput: Content {}
extension LoginInput: Content {}
extension SendUserVerificationResponse: Content {}
extension UserVerificationPayload: Content {}
#endif

import BSON

public struct VerifySMSInOutput: Codable, Equatable {
  public var phoneNumber: String
  public var attemptId: String?
  public var code: String?
  public var isLoggedIn: Bool? = false

  public init(
    phoneNumber: String,
    attemptId: String? = nil,
    code: String? = nil,
    isLoggedIn: Bool? = false
  ) {
    self.phoneNumber = phoneNumber
    self.attemptId = attemptId
    self.code = code
    self.isLoggedIn = isLoggedIn
  }

}

// this belove code have to remove we have already alternative struct this
public struct LoginInput: Codable {
    public init(phoneNumber: String) {
        self.phoneNumber = phoneNumber
    }
    
    public let phoneNumber: String
}

public struct SendUserVerificationResponse: Codable {
    public init(phoneNumber: String, attemptId: ObjectId) {
        self.phoneNumber = phoneNumber
        self.attemptId = attemptId
    }
    
    public let phoneNumber: String
    public let attemptId: ObjectId
}

public struct UserVerificationPayload: Codable {
    public init(attemptId: ObjectId, phoneNumber: String, code: String) {
        self.attemptId = attemptId
        self.phoneNumber = phoneNumber
        self.code = code
    }
    
    public let attemptId: ObjectId
    public let phoneNumber: String
    public let code: String
}
