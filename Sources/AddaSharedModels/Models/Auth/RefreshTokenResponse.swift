//
//  RefreshTokenResponse.swift
//  
//
//  Created by Alif on 7/6/20.
//

#if os(macOS)
import Vapor

struct RefreshTokenResponse: Content {
    let accessToken: String
    let refreshToken: String
}

#endif
