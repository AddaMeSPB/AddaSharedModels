//
//  SMSVerification.swift
//  
//
//  Created by Alif on 7/6/20.
//

#if os(macOS)
import Vapor
import Fluent
import FluentMongoDriver

final class SMSVerificationAttempt: Model, Content {
    static let schema = "sms_verification_attempts"
    
    @ID(custom: "id") var id: ObjectId?
    @Field(key: "expiresAt") var expiresAt: Date?
    @Field(key: "phoneNumber") var phoneNumber: String
    @Field(key: "code") var code: String
    
    init() { }
    
    init(code: String, expiresAt: Date?, phoneNumber: String) {
        self.code = code
        self.expiresAt = expiresAt
        self.phoneNumber = phoneNumber
    }
}

#endif
