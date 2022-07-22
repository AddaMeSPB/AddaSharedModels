extension VerifySMSInOutput {
    static public var draff: VerifySMSInOutput = .init(
        phoneNumber: UserOutput.withNumber.phoneNumber,
        attemptId: "165541EC-692E-440A-9CF8-565776E9DC99",
        code: "336699",
        isLoggedIn: false
    )
}

extension LoginResponse {
    static public var draff: LoginResponse = .init(status: "online", user: .withNumber, access: .draff)
}

extension RefreshTokenResponse {
    static public var draff: RefreshTokenResponse = .init(accessToken: "", refreshToken: "")
}
