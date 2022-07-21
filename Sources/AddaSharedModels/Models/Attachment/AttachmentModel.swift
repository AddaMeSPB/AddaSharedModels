#if os(macOS) || os(Linux)
import Vapor
import Fluent
import FluentMongoDriver

public final class Attachment: Model {
    
    public static var schema = "attachments"
    
    public init() {}
    
    public init(id: ObjectId? = nil, type: AttachmentType = .image, userId: User.IDValue?, imageUrlString: String? = nil, audioUrlString: String? = nil, videoUrlString: String? = nil, fileUrlString: String? = nil)  {
        self.id = id
        self.type = type
        self.$user.id = userId
        self.imageUrlString = imageUrlString
        self.audioUrlString = audioUrlString
        self.videoUrlString = videoUrlString
        self.fileUrlString = fileUrlString
    }
    
    @ID(custom: "id") public var id: ObjectId?
    @Field(key: "type") public var type: AttachmentType
    
    @OptionalParent(key: "userId") public var user: User?
    
    @OptionalField(key: "imageUrlString") public var imageUrlString: String?
    @OptionalField(key: "audioUrlString") public var audioUrlString: String?
    @OptionalField(key: "videoUrlString") public var videoUrlString: String?
    @OptionalField(key: "fileUrlString") public var fileUrlString: String?
    
    @Timestamp(key: "createdAt", on: .create) public var createdAt: Date?
    @Timestamp(key: "updatedAt", on: .update) public var updatedAt: Date?
    @Timestamp(key: "deletedAt", on: .delete) public var deletedAt: Date?
    
}

extension Attachment {
    public var response: AttachmentInOutPut { .init(self) }
}

extension AttachmentInOutPut: Content {}

extension AttachmentInOutPut {
    public init(_ attachment: Attachment) {
        self.id = attachment.id
        self.type = attachment.type
        self.userId = attachment.$user.id
        self.imageUrlString = attachment.imageUrlString
        self.audioUrlString = attachment.audioUrlString
        self.videoUrlString = attachment.videoUrlString
        self.fileUrlString = attachment.fileUrlString
        self.createdAt = attachment.createdAt
        self.updatedAt = attachment.updatedAt
        self.deletedAt = attachment.deletedAt
    }
}

#endif
