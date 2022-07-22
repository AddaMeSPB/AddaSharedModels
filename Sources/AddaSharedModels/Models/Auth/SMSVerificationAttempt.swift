//
//  SMSVerification.swift
//  
//
//  Created by Alif on 7/6/20.
//

#if os(macOS) || os(Linux)
import Vapor
import Fluent
import BSON

public final class SMSVerificationAttempt: Model, Content {
    static public let schema = "sms_verification_attempts"
    
    @ID(custom: "id") public var id: ObjectId?
    @Field(key: "expiresAt") public var expiresAt: Date?
    @Field(key: "phoneNumber") public var phoneNumber: String
    @Field(key: "code") public var code: String
    
    public init() { }
    
    public init(code: String, expiresAt: Date?, phoneNumber: String) {
        self.code = code
        self.expiresAt = expiresAt
        self.phoneNumber = phoneNumber
    }
}

#endif
