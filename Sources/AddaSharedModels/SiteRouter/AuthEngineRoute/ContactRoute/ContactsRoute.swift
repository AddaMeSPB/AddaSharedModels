
import URLRouting

public enum ContactsRoute: Equatable {
    case getRegisterUsers(inputs: MobileNumbersInput)
}

public let contactsRouter = OneOf {
    Route(.case(ContactsRoute.getRegisterUsers)) {
        Method.post
        Body(.json(MobileNumbersInput.self))
    }
}
