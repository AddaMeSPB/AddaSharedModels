
import BSON

// MARK:- OTP via Email
public struct EmailLoginInput: Codable, Equatable {
    public init(
        email: String
    ) {
        self.email = email
    }

    public var email: String
}

public struct EmailLoginOutput: Codable, Equatable {
  public var email: String
  public var attemptId: ObjectId

  public init(
    email: String,
    attemptId: ObjectId
  ) {
    self.email = email
    self.attemptId = attemptId
  }

}

public struct VerifyEmailInput: Codable, Equatable {
  public let niceName: String
  public var email: String
  public var attemptId: ObjectId
  public var code: String

  public init(
    niceName: String,
    email: String,
    attemptId: ObjectId,
    code: String
  ) {
    self.niceName = niceName
    self.email = email
    self.attemptId = attemptId
    self.code = code
  }

}
