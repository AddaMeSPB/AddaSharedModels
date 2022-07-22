
import URLRouting

public enum AttachmentsRoute: Equatable {
    case create(input: AttachmentInOutPut)
    case list
    case delete(id: String)
}

public let attachmentsRouter = OneOf {
    Route(.case(AttachmentsRoute.create)) {
        Method.post
        Body(.json(AttachmentInOutPut.self))
    }
    
    Route(.case(AttachmentsRoute.list))
    
    Route(.case(AttachmentsRoute.delete)) {
        Method.delete
        Path { Parse(.string) }
    }
}
