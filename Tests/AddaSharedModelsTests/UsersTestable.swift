#if os(macOS) || os(Linux)
@testable import AddaSharedModels
import Fluent
import MongoKitten

extension User {
    public static func create(
        phoneNumber: String,
        firstName: String,
        database: Database
    ) throws -> User {
        let user = User(phoneNumber: phoneNumber, firstName: firstName)
        try user.save(on: database).wait()
        return user
    }
}
#endif

