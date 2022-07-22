import URLRouting

public enum AuthenticationRoute: Equatable {
    case login(input: VerifySMSInOutput)
    case verifySms(input: VerifySMSInOutput)
    case refreshToken(input: RefreshTokenInput)
}

public let authenticationRouter = OneOf {
    Route(.case(AuthenticationRoute.login)) {
        Path { "login" }
        Method.post
        Body(.json(VerifySMSInOutput.self))
    }

    Route(.case(AuthenticationRoute.verifySms)) {
        Path { "verify_sms" }
        Method.post
        Body(.json(VerifySMSInOutput.self))
    }

    Route(.case(AuthenticationRoute.refreshToken)) {
        Path { "refresh_token" }
        Method.post
        Body(.json(RefreshTokenInput.self))
    }
}
