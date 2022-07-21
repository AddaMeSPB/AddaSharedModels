
#if os(macOS) || os(Linux)
@testable import AddaSharedModels
import Fluent

extension Conversation {
    static func create(
        title: String,
        type: ConversationType,
        member: User,
        admin: User,
        database: Database
    ) throws -> Conversation {
        
        let conversation = Conversation(title: title, type: type)
        try conversation.save(on: database).wait()
        
        _ = try UserConversation.create(member: member, admin: admin, conversation: conversation, database: database)
        
        return conversation
    }
}
#endif
