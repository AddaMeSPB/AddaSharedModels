
#if os(macOS) || os(Linux)
import Vapor
import Fluent
import FluentMongoDriver

public final class BlockList: Model {
    
    public static var schema = "block_lists"
    
    public init() {}
    
    public init(id: ObjectId?, ownerID: ObjectId, blockUserIDs: Set<[ObjectId]>) {
        self.id = id
        self.ownerID = ownerID
        self.blockUserIDs = blockUserIDs
    }
    
    @ID(custom: "id") public var id: ObjectId?
    @Field(key: "ownerId") public var ownerID: ObjectId
    @Field(key: "blockUserIds") public var blockUserIDs: Set<[ObjectId]>
    
    @Timestamp(key: "createdAt", on: .create) public var createdAt: Date?
    @Timestamp(key: "updatedAt", on: .update) public var updatedAt: Date?
    @Timestamp(key: "deletedAt", on: .delete) public var deletedAt: Date?
    
}

extension BlockList: Content {
    public var response: BlockListInoutPut { .init(self) }
}

extension BlockListInoutPut {
    public init(_ blockList: BlockList) {
        self.id = blockList.id
        self.userID = blockList.ownerID
        self.blockUserIDs = blockList.blockUserIDs
        self.createdAt = blockList.createdAt
        self.updatedAt = blockList.updatedAt
        self.deletedAt = blockList.deletedAt
    }
}
#endif
