
import Foundation
import URLRouting

public enum ConversationsRoute: Equatable {
    case create(input: ConversationCreate)
    case list(query: QueryItem)
    case update(input: ConversationOutPut)
    case delete(id: String)
    
    // ConversationRoute
    case conversation(id: String, route: ConversationRoute = .find)
}

public let conversationsRouter = OneOf {
    Route(.case(ConversationsRoute.create)) {
        Method.post
        Body(.json(ConversationCreate.self))
    }
    
    Route(.case(ConversationsRoute.list)) {
        Parse(.memberwise(QueryItem.init)) {
            Query {
                Field("page", default: 1) { Digits() }
                Field("per", default: 10) { Digits() }
            }
        }
    }
    
    Route(.case(ConversationsRoute.update)) {
        Method.put
        Body(.json(ConversationOutPut.self))
    }
    
    Route(.case(ConversationsRoute.delete)) {
        Method.delete
        Path { Parse(.string) }
    }
    
    // ConversationRoute
    Route(.case(ConversationsRoute.conversation)) {
        Path { Parse(.string) }
        conversationRouter
    }
}
