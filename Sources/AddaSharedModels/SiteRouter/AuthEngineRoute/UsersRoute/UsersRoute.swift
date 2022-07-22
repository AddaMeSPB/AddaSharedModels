
import URLRouting

public enum UsersRoute: Equatable {
    case user(id: String, route: UserRoute)
    case update(input: UserOutput)
}

public let usersRouter = OneOf {
    Route(.case(UsersRoute.user)) {
        Path { Parse(.string) }
        userRouter
    }
    
    Route(.case(UsersRoute.update)) {
        Method.put
        Body(.json(UserOutput.self))
    }
}
