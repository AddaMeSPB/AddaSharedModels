
import URLRouting

public enum AttachmentsRoute: Equatable {
    case create(input: AttachmentInOutPut)
    case findWithOwnerId
    case attachment(id: String, AttachmentRoute)
}

public let attachmentsRoute = OneOf {
    Route(.case(AttachmentsRoute.create)) {
        Method.post
        Body(.json(AttachmentInOutPut.self))
    }

    Route(.case(AttachmentsRoute.findWithOwnerId))

    Route(.case(AttachmentsRoute.attachment)) {
        Path { Parse(.string) }
        attachmentRoute
    }
}

public enum AttachmentRoute: Equatable {
    case delete
}


public let attachmentRoute = OneOf {

    Route(.case(AttachmentRoute.delete)) {
        Method.delete
    }
}
