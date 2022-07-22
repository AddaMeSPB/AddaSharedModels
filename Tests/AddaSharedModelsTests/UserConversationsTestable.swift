
#if os(macOS) || os(Linux)
@testable import AddaSharedModels
import Fluent
import BSON

extension UserConversation {
    static func create(
        member: User,
        admin: User,
        conversation: Conversation,
        database: Database
    ) throws -> UserConversation {
        let userConveration = try UserConversation(
            id: ObjectId(),
            member: member,
            admin: admin,
            conversation: conversation
        )
        try userConveration.save(on: database).wait()
        return userConveration
    }
}
#endif
