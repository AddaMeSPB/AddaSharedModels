
import URLRouting

public enum AuthEngineRoute: Equatable {
    case authentication(AuthenticationRoute)
    case users(UsersRoute)
    case contacts(ContactsRoute)
    case devices(DevicesRoute)
}

public let authEngineRoute = OneOf {
    Route(.case(AuthEngineRoute.authentication)) {
        Path { "auth" }
        authenticationRouter
    }

    Route(.case(AuthEngineRoute.users)) {
        Path { "users" }
        usersRouter
    }
    
    Route(.case(AuthEngineRoute.contacts)) {
        Path { "contacts" }
        contactsRouter
    }
    
    Route(.case(AuthEngineRoute.devices)) {
        Path { "devices" }
        devicesRouter
    }
}
