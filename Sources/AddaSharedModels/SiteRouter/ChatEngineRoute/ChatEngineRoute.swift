
import URLRouting

public enum ChatEngineRoute: Equatable {
    case conversations(ConversationsRoute)
    case messages(MessagesRoute)
}

public let chatEngineRouter = OneOf {
    Route(.case(ChatEngineRoute.conversations)) {
        Path { "conversations" }
        conversationsRouter
    }
    
    Route(.case(ChatEngineRoute.messages)) {
        Path { "messages" }
        messagesRouter
    }
}
