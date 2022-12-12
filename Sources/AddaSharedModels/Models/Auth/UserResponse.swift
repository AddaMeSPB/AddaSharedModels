

public struct RefreshTokenResponse: Codable {
    public var accessToken: String
    public var refreshToken: String
    
    public init(accessToken: String, refreshToken: String) {
      self.accessToken = accessToken
      self.refreshToken = refreshToken
    }
}


// MARK: - Login Response for mobile auth

public struct SuccessfulLoginResponse: Codable {
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

    public static func == (lhs: Self, rhs: Self) -> Bool {
      lhs.user == rhs.user
      && lhs.access?.accessToken == rhs.access?.accessToken
    }
}

extension SuccessfulLoginResponse: Equatable {}
