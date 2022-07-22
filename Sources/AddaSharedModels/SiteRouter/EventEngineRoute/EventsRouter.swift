
import Foundation
import URLRouting
import BSON

public enum EventsRoute: Equatable {
    case create(eventInput: EventInput)
    case list(query: EventPageRequest)
    case update(eventInput: EventResponse)
    
    case find(eventId: String, EventRoute = .find)
    case delete(eventId: String, EventRoute = .delete)
}

public let eventsRouter = OneOf {
    
    Route(.case(EventsRoute.create)) {
        Method.post
        Body(.json(EventInput.self))
    }
    
    Route(.case(EventsRoute.list)) {
        Parse(.memberwise(EventPageRequest.init)) {
            Query {
                Field("page", default: 1) { Digits() }
                Field("per", default: 10) { Digits() }
                Field("lat", default: 59.93572512685927) { Double.parser() }
                Field("long", default: 30.32722285814234) { Double.parser() }
                Field("distance", default: 300000.0) { Double.parser() }
            }
        }
    }
    
    Route(.case(EventsRoute.update)) {
        Method.put
        Body(.json(EventResponse.self))
    }
    
    Route(.case(EventsRoute.delete)) {
        Path { Parse(.string) }
        eventRouter
    }
    
    Route(.case(EventsRoute.find)) {
        Path { Parse(.string) }
        eventRouter
    }
    
}


//let objectIdParser = ParsePrint {
//    Prefix<Substring> { $0.isHexDigit }
//    .map(.string)
//    .map(
//      .convert(
//        apply: { ObjectId($0) },
//        unapply: { $0.hexString }
//      )
//    )
//}
