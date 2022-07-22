import BSON
import Foundation

extension ConversationCreate {
    static public let exploreAreaDraff: ConversationCreate = .init(
        title: CreateCategory.exploreAreaDraff.name,
        type: .group,
        opponentPhoneNumber: "+79211111111"
    )
    
    static public let runningDraff: ConversationCreate = .init(
        title: CreateCategory.runningDraff.name,
        type: .group,
        opponentPhoneNumber: "+79211111112"
    )
    
    static public let walkAroundDraff: ConversationCreate = .init(
        title: CreateCategory.walkAroundDraff.name,
        type: .group,
        opponentPhoneNumber: "+79211111113"
    )
    
    static public let lookingForAcompanyDraff: ConversationCreate = .init(
        title: CreateCategory.lookingForAcompanyDraff.name,
        type: .group,
        opponentPhoneNumber: "+79211111114"
    )
    
    static public let empty: ConversationCreate = .init(
        title: "",
        type: .oneToOne,
        opponentPhoneNumber: "+79211111115"
    )
}

extension AddUser: Equatable {
    public static func == (lhs: AddUser, rhs: AddUser) -> Bool {
        return lhs.conversationsId == rhs.conversationsId && lhs.usersId == rhs.usersId
    }
}

extension AddUser {
    static public let draff = AddUser(
        conversationsId: ConversationOutPut.exploreAreaDraff.id,
        usersId: UserOutput.withFirstName.id!
    )
}

extension ConversationOutPut {
    static public var walkAroundDraff: ConversationOutPut = .init(
        id: ObjectId("5fabb1ebaa5f7844ccfe48c3")!,
        title: ConversationCreate.walkAroundDraff.title,
        type: ConversationCreate.walkAroundDraff.type,
        admins: [.withFirstName],
        members: [.withAttachments, .withLastName],
        lastMessage: nil,
        createdAt: Date(),
        updatedAt: Date(),
        deletedAt: Date()
    )
    
    static public var runningDraff: ConversationOutPut = .init(
        id: ObjectId("2fabb1ebaa5f7844ccfe48c1")!,
        title: ConversationCreate.runningDraff.title,
        type: ConversationCreate.runningDraff.type,
        admins: [.withLastName],
        members: [.withAttachments, .withFirstName],
        lastMessage: nil,
        createdAt: Date(),
        updatedAt: Date(),
        deletedAt: Date()
    )
    
    static public var exploreAreaDraff: ConversationOutPut = .init(
        id: ObjectId("5fabb1ebaa5f7844ccfe45c3")!,
        title: ConversationCreate.exploreAreaDraff.title,
        type: ConversationCreate.exploreAreaDraff.type,
        admins: [.withFirstName],
        members: [.withAttachments, .withLastName],
        lastMessage: nil,
        createdAt: Date(),
        updatedAt: Date(),
        deletedAt: Date()
    )
    
    static public var lookingForAcompanyDraff: ConversationOutPut = .init(
        id: ObjectId("2fabb1ebaa5f1844ccfe48c1")!,
        title: ConversationCreate.lookingForAcompanyDraff.title,
        type: ConversationCreate.lookingForAcompanyDraff.type,
        admins: [.withLastName],
        members: [.withAttachments, .withFirstName],
        lastMessage: nil,
        createdAt: Date(),
        updatedAt: Date(),
        deletedAt: Date()
    )
    
    static public let conversationsMock: [ConversationOutPut] = [
        .walkAroundDraff, .runningDraff, .exploreAreaDraff, lookingForAcompanyDraff
    ]
}

extension ConversationsResponse {
    static public var conversationResponseMock: ConversationsResponse = .init(
        items: ConversationOutPut.conversationsMock,
        metadata: Metadata.init(per: 10, total: ConversationOutPut.conversationsMock.count, page: 1)
    )
}
