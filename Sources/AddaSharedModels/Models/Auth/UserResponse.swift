//
//  UserResponse.swift
//  
//
//  Created by Alif on 7/6/20.
//

#if os(macOS) || os(Linux)
import Vapor

extension RefreshTokenResponse: Content {}
extension LoginResponse: Content {}
extension UserSuccessResponse: Content {}

#endif

public struct UserSuccessResponse: Codable {
    let user: UserOutput
    
    public init(user: UserOutput) {
        self.user = user
    }
}

public struct RefreshTokenResponse: Codable {
    public var accessToken: String
    public var refreshToken: String
    
    public init(accessToken: String, refreshToken: String) {
      self.accessToken = accessToken
      self.refreshToken = refreshToken
    }
}


// MARK: - Login Response

public struct LoginResponse: Codable, Equatable {
  public let status: String
  public let user: UserOutput?
  public let access: RefreshTokenResponse?

  public init(
    status: String,
    user: UserOutput? = nil,
    access: RefreshTokenResponse? = nil
  ) {
    self.status = status
    self.user = user
    self.access = access
  }
    
    public static func == (lhs: LoginResponse, rhs: LoginResponse) -> Bool {
        lhs.user == rhs.user
        && lhs.access?.accessToken == rhs.access?.accessToken
    }
}
