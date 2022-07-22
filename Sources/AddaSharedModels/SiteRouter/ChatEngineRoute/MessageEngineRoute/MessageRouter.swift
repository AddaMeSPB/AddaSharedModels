
import URLRouting

public enum MessageRoute: Equatable {
    case find
}

public let messageRouter = OneOf {
    Route(.case(MessageRoute.find))
}
