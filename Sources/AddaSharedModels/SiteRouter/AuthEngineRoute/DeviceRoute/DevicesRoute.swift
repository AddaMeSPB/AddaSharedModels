
import URLRouting

public enum DevicesRoute: Equatable {
    case createOrUpdate(input: DeviceInOutPut)
}

public let devicesRouter = OneOf {
    Route(.case(DevicesRoute.createOrUpdate)) {
        Method.post
        Body(.json(DeviceInOutPut.self))
    }
}
