
import Foundation
import URLRouting
import Vapor

public enum EventRoute: Equatable {
    case fetch
    case update(EventInput)
    case delete
}

public let eventRouter = OneOf {
    Route(.case(EventRoute.fetch))
    Route(.case(EventRoute.update)) {
        Method.put
        Body(.json(EventInput.self))
    }
    Route(.case(EventRoute.delete)) {
        Method.delete
    }
}

public enum EventsRoute: Equatable {
    case create(EventInput)
    case event(String, EventRoute = .fetch)
    case list
    case update(EventInput, EventRoute = .update(.empty))
    case delete(String, EventRoute = .delete)
}

public let eventsRouter = OneOf {
    
    Route(.case(EventsRoute.create)) {
        Method.post
        Body(.json(EventInput.self))
    }
    
    Route(.case(EventsRoute.event)) {
        Path { Parse(.string) }
        eventRouter
    }
    
    Route(.case(EventsRoute.list)) {
        Method.get
    }
    
    Route(.case(EventsRoute.update)) {
        Body(.json(EventInput.self))
        eventRouter
    }
    
    Route(.case(EventsRoute.delete)) {
        Path { Parse(.string) }
        eventRouter
    }
}
