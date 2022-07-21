//
//  UserResponse.swift
//  
//
//  Created by Alif on 7/6/20.
//

#if os(macOS)
import Vapor

extension RefreshResponse: Content {}
extension LoginResponse: Content {}
extension UserSuccessResponse: Content {}

#endif

protocol AccessTokenStorage: AnyObject {
    var access: RefreshResponse { get set }
}

public struct UserSuccessResponse: Codable {
    let user: UserOutput
    
    public init(user: UserOutput) {
        self.user = user
    }
}

public struct RefreshResponse: Codable {
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
  public let user: UserOutput
  public let access: RefreshResponse

  public init(
    status: String,
    user: UserOutput,
    access: RefreshResponse
  ) {
    self.status = status
    self.user = user
    self.access = access
  }
    
    public static func == (lhs: LoginResponse, rhs: LoginResponse) -> Bool {
        lhs.user == rhs.user
        && lhs.access.accessToken == rhs.access.accessToken
    }
}
