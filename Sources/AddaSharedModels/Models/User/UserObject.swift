
import BSON

public enum UserRole: String, Codable, CaseIterable {
    case basic, superAdmin, englishAdmin, russianAdmin, banglaAdmin, spanishAdmin
}

public enum UserLanguage: String, Codable, CaseIterable {
    case russian, english, bangla, spanish

    public var rawValue: String {
        switch self {
        case .english: return "english"
        case .russian: return "russian"
        case .bangla: return "bangla"
        case .spanish: return "spanish"
        }
    }
}

public struct UserRoleAndLanguage: Encodable {
    public init() {}

    public let roles = UserRole.allCases
    public let languages = UserLanguage.allCases
}

public struct UserCreateObject: Codable {
    public var fullName: String
    public var language: UserLanguage
    public var role: UserRole = .basic

    public var email: String?
    public var phoneNumber: String?
    public var passwordHash: String
}

public struct UserGetPublicObject: Codable {

    public let id: ObjectId?
    public let fullName: String
    public let role: UserRole
    public let language: UserLanguage

    public init(
        id: ObjectId? = nil,
        fullName: String,
        role: UserRole,
        language: UserLanguage
    ) {
        self.id = id
        self.fullName = fullName
        self.role = role
        self.language = language
    }
}

extension UserGetPublicObject: Equatable {}

extension UserGetPublicObject {
    public static let demo: Self = .init(fullName: "Demo", role: .banglaAdmin, language: .english)
}
