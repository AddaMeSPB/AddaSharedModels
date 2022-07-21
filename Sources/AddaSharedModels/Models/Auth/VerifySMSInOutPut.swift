//
//  VerifySMSInput.swift
//  
//
//  Created by Alif on 7/6/20.
//

#if os(macOS)
import Vapor
import MongoKitten

extension VerifySMSInOutput: Content {}

extension VerifySMSInOutput {
//    public init(
//      phoneNumber: String,
//      attemptId: String? = nil,
//      code: String? = nil,
//      isLoggedIn: Bool? = false
//    ) {
//      self.phoneNumber = phoneNumber
//      self.attemptId = attemptId
//      self.code = code
//      self.isLoggedIn = isLoggedIn
//    }
}

#endif

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

  public static var draff: Self {
    .init(phoneNumber: "")
  }
}
