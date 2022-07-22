
#if os(macOS) || os(Linux)
import Vapor
import Fluent
import FluentMongoDriver

public final class Event: Model {
    public static var schema = "events"
    
    public init() {}
    
    public init(
        id: ObjectId? = nil,
        name: String,
        details: String? = nil,
        imageUrl: String? = nil,
        duration: Int,
        distance: Double? = nil,
        
        isActive: Bool,
        addressName: String,
        geoType: GeoType,
        coordinates: [Double],
        sponsored: Bool? = false,
        overlay: Bool? = false,
        ownerId: User.IDValue,
        conversationsId: Conversation.IDValue,
        categoriesId: Category.IDValue,
        
        urlString: String
    ) {
        self.id = id
        self.name = name
        self.details = details
        self.imageUrl = imageUrl
        self.duration = duration
        self.distance = distance
        self.isActive = isActive
        
        // Place information
        self.addressName = addressName
        self.type = geoType
        self.coordinates = coordinates
        self.sponsored = sponsored
        self.overlay = overlay
        
        self.$owner.id = ownerId
        self.$conversation.id = conversationsId
        self.$category.id = categoriesId
        
    }
    
    public init(
        content: EventInput,
        ownerID: ObjectId,
        conversationsID: ObjectId,
        categoriesID: ObjectId
    ) {
        self.name = content.name
        self.details = content.details
        self.imageUrl = content.imageUrl
        self.duration = content.duration
        self.isActive = content.isActive
        
        // Place information
        self.addressName = content.addressName
        self.type = content.type
        self.coordinates = content.coordinates
        self.sponsored = content.sponsored
        self.overlay = content.overlay
        
        self.$owner.id = ownerID
        self.$conversation.id = conversationsID
        self.$category.id = categoriesID
        
    }
    
    @ID(custom: "id") public var id: ObjectId?
    @Field(key: "name") public var name: String
    @OptionalField(key: "details") public var details: String?
    @OptionalField(key: "imageUrl") public var imageUrl: String?
    @Field(key: "duration") public var duration: Int
    @OptionalField(key: "distance") public var distance: Double?
    @Field(key: "isActive") public var isActive: Bool
    
    // Place information
    @Field(key: "addressName") public var addressName: String
    @Field(key: "type") public var type: GeoType
    @Field(key: "coordinates") public var coordinates: [Double]
    @OptionalField(key: "sponsored") public var sponsored: Bool?
    @OptionalField(key: "overlay") public var overlay: Bool?
    
    @Parent(key: "ownerId") public var owner: User
    @Parent(key: "conversationsId") public var conversation: Conversation
    @Parent(key: "categoriesId") public var category: Category
    
    @Timestamp(key: "createdAt", on: .create) public var createdAt: Date?
    @Timestamp(key: "updatedAt", on: .update) public var updatedAt: Date?
    @Timestamp(key: "deletedAt", on: .delete) public var deletedAt: Date?
    
}

extension Event: Equatable {
    public static func == (lhs: Event, rhs: Event) -> Bool {
        return lhs.id == rhs.id && lhs.isActive == rhs.isActive
        && lhs.createdAt == rhs.createdAt
        && lhs.addressName == rhs.addressName
        && rhs.coordinates == rhs.coordinates
    }
}

extension Event {

    public var response: EventResponse { .init(self) }
 
    public func update(_ input: EventResponse) async throws {
        id = input.id
        name = input.name
        details = input.details
        imageUrl = input.imageUrl
        duration = input.duration
        isActive = input.isActive
        category.id = input.categoriesId
        conversation.id = input.conversationsId
        addressName = input.addressName
        sponsored = input.sponsored
        overlay = input.overlay
        type = input.type
        coordinates = input.coordinates
    }
}

extension EventInput: Content {}
extension EventResponse: Content {}

extension EventResponse {
    public init(_ event: Event) {
        self.id = event.id ?? ObjectId()
        self.name = event.name
        self.details = event.details
        self.imageUrl = event.imageUrl
        self.duration = event.duration
        self.distance = event.distance
        self.isActive = event.isActive
        self.conversationsId = event.$conversation.id
        self.categoriesId = event.$category.id
        
        // Place information
        self.addressName = event.addressName
        self.type = event.type
        self.coordinates = [event.coordinates[1], event.coordinates[0]]
        self.sponsored = event.sponsored
        self.overlay = event.overlay
        
        self.createdAt = event.createdAt
        self.updatedAt = event.updatedAt
        self.deletedAt = event.deletedAt
        
        self.url = .home
        //request.application.router.url(for: .eventEngine(.events(.event(event.id, .fetch))))
    }
}

extension EventPage: Content {}

public struct EventPage {
    /// The page's items. Usually models.
    public let items: [EventResponse]
    
    /// Metadata containing information about current page, items per page, and total items.
    public let metadata: PageMetadata
    
    /// Creates a new `Page`.
    public init(items: [EventResponse], metadata: PageMetadata) {
        self.items = items
        self.metadata = metadata
    }
}

#endif
