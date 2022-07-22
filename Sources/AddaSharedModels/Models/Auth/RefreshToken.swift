//
//  RefreshToken.swift
//  
//
//  Created by Alif on 7/6/20.
//

#if os(macOS) || os(Linux)
import Vapor
import JWT
import BSON

public struct RefreshToken: JWTPayload {
    public var id: ObjectId?
    public var iat: Int
    public var exp: Int

  public init(user: User, expiration: Int = 31536000) { // Expiration 1 year
        let now = Date().timeIntervalSince1970
        self.id = user.id
        self.iat = Int(now)
        self.exp = Int(now) + expiration
    }

   public func verify(using signer: JWTSigner) throws {
        let expiration = Date(timeIntervalSince1970: TimeInterval(self.exp))
        try ExpirationClaim(value: expiration).verifyNotExpired()
    }
}

#endif
