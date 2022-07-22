import Foundation
import URLRouting

public enum MessagesRoute: Equatable {
    case create(input: MessageItem)
    case list(query: QueryItem)
    case update(input: MessageItem)
    case delete(id: String)
    
    // MessageRoute
    case find(id: String, route: MessageRoute = .find)
}

public let messagesRouter = OneOf {
    
    Route(.case(MessagesRoute.create)) {
        Method.post
        Body(.json(MessageItem.self))
    }
    
    Route(.case(MessagesRoute.list)) {
        Parse(.memberwise(QueryItem.init)) {
            Query {
                Field("page", default: 1) { Digits() }
                Field("per", default: 10) { Digits() }
            }
        }
    }
    
    Route(.case(MessagesRoute.update)) {
        Method.put
        Body(.json(MessageItem.self))
    }
    
    Route(.case(MessagesRoute.delete)) {
        Method.delete
        Path { Parse(.string) }
    }
    
//    // MessageRoute
    Route(.case(MessagesRoute.find)) {
        Path { Parse(.string) }
        messageRouter
    }
}
