
import URLRouting

public enum UserRoute: Equatable {
    case find
    case deleteSoft
    case restore
    case delete
    
    
    case attachments(AttachmentsRoute)
    case conversations(ConversationsRoute)
    case devices(DevicesRoute)
    case events(EventsRoute)
    
}

public let userRouter = OneOf {
    Route(.case(UserRoute.find))
    
    Route(.case(UserRoute.deleteSoft)) {
        Method.delete
        Path { "soft" }
    }
    
    Route(.case(UserRoute.restore)) {
        Method.put
        Path { "restore" }
    }
    
    Route(.case(UserRoute.delete)) {
        Method.delete
    }
    
    Route(.case(UserRoute.attachments)) {
        Path { "attachments" }
        attachmentsRouter
    }
    
    Route(.case(UserRoute.conversations)) {
        Path { "conversations" }
        conversationsRouter
    }
    
    Route(.case(UserRoute.devices)) {
        Path { From(.utf8) { "devices".utf8 } }
        devicesRouter
    }
    
    Route(.case(UserRoute.events)) {
        Path { "events" }
        eventsRouter
    }
}
