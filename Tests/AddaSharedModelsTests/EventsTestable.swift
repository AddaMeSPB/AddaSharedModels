
#if os(macOS) || os(Linux)
@testable import AddaSharedModels
import Fluent
import MongoKitten

extension Event {
    public static func create(
        name: String = "Walk&Talk",
        details: String = "Lets have good walk then talk",
        imageUrl: String? = nil,
        duration: Int = 36000,
        isActive: Bool = true,
        ownerId: ObjectId? = nil,
        categoriesId: ObjectId = ObjectId(),
        conversationsId: ObjectId = ObjectId(),
        addressName: String = "some address",
        sponsored: Bool = false,
        overlay: Bool? = false,
        type: GeoType = .Polygon,
        coordinates: [Double] = [0.0, 0.0],
        
        user: User,
        category: Category,
        conversation: Conversation,
        databse: Database
    ) throws -> Event {        
        let event = Event(
            name: name, details: details, imageUrl: imageUrl, duration: duration,
            distance: nil, isActive: isActive, addressName: addressName, geoType: type,
            coordinates: coordinates, sponsored: sponsored, overlay: overlay,
            ownerId: user.id!, conversationsId: conversation.id!, categoriesId: category.id!
        )
        try event.save(on: databse).wait()
        return event
    }
}
#endif
