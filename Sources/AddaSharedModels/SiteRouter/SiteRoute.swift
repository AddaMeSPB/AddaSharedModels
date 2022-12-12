
import URLRouting

public enum SiteRoute: Equatable {
    case eventEngine(EventEngineRoute)
    case chatEngine(ChatEngineRoute)
    case authEngine(AuthEngineRoute)
    case terms
    case privacy
}

public let siteRouter = OneOf {
    Route(.case(SiteRoute.eventEngine)) {
        Path { "v1" }
        eventEngineRouter
    }

    Route(.case(SiteRoute.chatEngine)) {
        Path { "v1" }
        chatEngineRouter
    }
    
    Route(.case(SiteRoute.authEngine)) {
        Path { "v1" }
        authEngineRoute
    }

    Route(.case(SiteRoute.terms)) {
        Path { "terms" }
    }
    
    Route(.case(SiteRoute.privacy)) {
        Path { "privacy" }
    }
}
