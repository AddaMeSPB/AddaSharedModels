import Foundation
import BSON

extension EventInput {
    
    static public let walkAroundDraff: EventInput = .init(
        name: "Walk around 🚶🏽🚶🏼‍♀️",
        duration: 36000,
        isActive: true,
        ownerId: UserOutput.withFirstName.id,
        conversationsId: ConversationOutPut.walkAroundDraff.id,
        categoriesId: CategoryResponse.walkAroundDraff.id,
        addressName: "188839, Первомайское, СНТ Славино-2 Поселок, 31 Первомайское Россия",
        type: .Point,
        coordinates: [60.261340452875721, 29.873706166262373]
    )
    
    static public let exploreAreaDraff: EventInput = .init(
        name: "Explore Area",
        duration: 36000,
        isActive: true,
        ownerId: UserOutput.withFirstName.id,
        conversationsId: ConversationOutPut.exploreAreaDraff.id,
        categoriesId: CategoryResponse.exploreAreaDraff.id,
        addressName: "8к1 лит Д улица Вавиловых, Saint Petersburg",
        type: .Point,
        coordinates: [60.020532228306031, 30.388014239849944]
    )
    
    static public let bicyclingDraff: EventInput = .init(
        name: "Bicycling 🚴🏽",
        duration: 14400,
        isActive: true,
        ownerId: UserOutput.withFirstName.id,
        conversationsId: ConversationOutPut.lookingForAcompanyDraff.id,
        categoriesId: CategoryResponse.lookingForAcompanyDraff.id,
        addressName: "9к5 улица Бутлерова Saint Petersburg, Saint Petersburg",
        type: .Point,
        coordinates: [60.00380571585201, 30.399472870547118]
    )
    
    static public let runningDraff: EventInput = .init(
        name: "Running",
        duration: 14400,
        isActive: true,
        ownerId: UserOutput.withFirstName.id,
        conversationsId: ConversationOutPut.runningDraff.id,
        categoriesId: CategoryResponse.runningDraff.id,
        addressName: "188839, Первомайское, СНТ Славино-2 Поселок, 31 Первомайское Россия",
        type: .Point,
        coordinates: [60.020525506753494, 30.387988546891499]
    )
    
}

extension EventResponse {
    static public let emptyDraff: EventResponse = .init(
        id: ObjectId("5fbfe54335a93bda87c7cb344") ?? ObjectId(),
        name: "",
        duration: 0,
        isActive: false,
        conversationsId: ObjectId(),
        categoriesId: ObjectId(),
        ownerId: ObjectId(),
        addressName: "",
        type: .GeometryCollection,
        coordinates: [0.0, 0.0],
        url: .home,
        createdAt: Date(),
        updatedAt: Date(),
        deletedAt: Date()
    )
    
    static public let walkAroundDraff: EventResponse = .init(
        id: ObjectId("5fbfe53335a93bda87c7cb32") ?? ObjectId(),
        name: EventInput.walkAroundDraff.name,
        duration: 36000,
        isActive: false,
        conversationsId: ConversationOutPut.walkAroundDraff.id,
        categoriesId: CategoryResponse.walkAroundDraff.id,
        ownerId: ObjectId(),
        addressName: "188839, Первомайское, СНТ Славино-2 Поселок, 31 Первомайское Россия",
        type: .GeometryCollection,
        coordinates: [60.261340452875721, 29.873706166262373],
        url: .home,
        createdAt: Date(),
        updatedAt: Date(),
        deletedAt: Date()
    )
    
    static public let exploreAreaDraff: EventResponse = .init(
        id: ObjectId("5fbfe53335a93bda87c7cb32") ?? ObjectId(),
        name: EventInput.exploreAreaDraff.name,
        duration: 36000,
        isActive: false,
        conversationsId: ConversationOutPut.exploreAreaDraff.id,
        categoriesId: CategoryResponse.exploreAreaDraff.id,
        ownerId: ObjectId(),
        addressName: "8к1 лит Д улица Вавиловых, Saint Petersburg",
        type: .Point,
        coordinates: [60.020532228306031, 30.388014239849944],
        url: .home,
        createdAt: Date(),
        updatedAt: Date(),
        deletedAt: Date()
    )
    
    static public let bicyclingDraff: EventResponse = .init(
        id: ObjectId("5fbea245b226053f0ece711c") ?? ObjectId(),
        name: EventInput.bicyclingDraff.name,
        duration: 14400,
        isActive: false,
        conversationsId: ConversationOutPut.runningDraff.id,
        categoriesId: CategoryResponse.runningDraff.id,
        ownerId: ObjectId(),
        addressName: "9к5 улица Бутлерова Saint Petersburg, Saint Petersburg",
        type: .GeometryCollection,
        coordinates: [60.00380571585201, 30.399472870547118],
        url: .home,
        createdAt: Date(),
        updatedAt: Date(),
        deletedAt: Date()
    )
    
    static public let runningDraff: EventResponse = .init(
        id: ObjectId("5fbea245b226053f0ece711c") ?? ObjectId(),
        name: EventInput.bicyclingDraff.name,
        duration: 14400,
        isActive: false,
        conversationsId: ConversationOutPut.runningDraff.id,
        categoriesId: CategoryResponse.runningDraff.id,
        ownerId: ObjectId(),
        addressName: "188839, Первомайское, СНТ Славино-2 Поселок, 31 Первомайское Россия",
        type: .GeometryCollection,
        coordinates: [60.020525506753494, 30.387988546891499],
        url: .home,
        createdAt: Date(),
        updatedAt: Date(),
        deletedAt: Date()
    )
}

extension EventsResponse {
    public static let draffEmpty = Self(
      items: [],
      metadata: .init(per: 0, total: 0, page: 0)
    )
    
    public static let draff = Self(
        items: [.exploreAreaDraff, .bicyclingDraff, .walkAroundDraff, .runningDraff],
      metadata: .init(per: 0, total: 0, page: 0)
    )
}
