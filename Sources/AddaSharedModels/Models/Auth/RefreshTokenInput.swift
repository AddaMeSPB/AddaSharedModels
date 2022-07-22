//
//  RefreshTokenInput
//  
//
//  Created by Alif on 7/6/20.
//

#if os(macOS) || os(Linux)
import Vapor

extension RefreshTokenInput: Content {}

#endif

public struct RefreshTokenInput: Codable {
    public var refreshToken: String
}

extension RefreshTokenInput: Equatable {}
