
import URLRouting

public enum EventRoute: Equatable {
    case find
    case delete
}

public let eventRouter = OneOf {
    Route(.case(EventRoute.find))
    Route(.case(EventRoute.delete)) {
        Method.delete
    }
}
