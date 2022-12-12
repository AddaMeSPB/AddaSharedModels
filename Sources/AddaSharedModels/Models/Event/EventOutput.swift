
import Foundation
import BSON

public struct EventOputput: Codable {

    public var _id: ObjectId
    public var name: String
    public var details: String?
    public var imageUrl: String?
    public var duration: Int
    public var distance: Double?
    public var isActive: Bool
    public var categoriesId: ObjectId
    public var conversationsId: ObjectId
    public var ownerId: ObjectId
    
    // Place Information
    public var addressName: String
    public var sponsored: Bool?
    public var overlay: Bool?
    public var type: GeoType
    public var coordinates: [Double]
    public var regionRadius: Double? = 1000
    
    public var createdAt, updatedAt, deletedAt: Date?
    
    public var recreateEventWithSwapCoordinatesForMongoDB: EventResponse {
        .init(
            id: _id,
            name: name,
            details: details,
            imageUrl: imageUrl,
            duration: duration,
            distance: distance,
            isActive: isActive,
            conversationsId: conversationsId,
            categoriesId: categoriesId,
            ownerId: ownerId,
            addressName: addressName,
            sponsored: sponsored,
            overlay: overlay,
            type: type,
            coordinates: swapCoordinatesForMongoDB(),
            url: .home,
            createdAt: createdAt,
            updatedAt: updatedAt,
            deletedAt: deletedAt
        )
    }
    
    public init(
        _id: ObjectId,
        name: String,
        details: String? = nil,
        imageUrl: String? = nil,
        duration: Int, distance: Double? = nil,
        isActive: Bool,
        conversationsId: ObjectId,
        categoriesId: ObjectId,
        userId: ObjectId,
        addressName: String,
        sponsored: Bool? = nil,
        overlay: Bool? = nil,
        type: GeoType,
        coordinates: [Double],
        createdAt: Date?, updatedAt: Date?, deletedAt: Date?
    ) {
        self._id = _id
        self.name = name
        self.details = details
        self.imageUrl = imageUrl
        self.duration = duration
        self.distance = distance
        self.isActive = isActive
        self.conversationsId = conversationsId
        self.categoriesId = categoriesId
        self.ownerId = userId
        self.addressName = addressName
        self.sponsored = sponsored
        self.overlay = overlay
        self.type = type
        self.coordinates = coordinates

        self.updatedAt = updatedAt
        self.createdAt = createdAt
        self.deletedAt = deletedAt
        
    }
    
    
    public func swapCoordinatesForMongoDB() -> [Double] {
        return [coordinates[1], coordinates[0]]
    }
}

extension EventOputput: Equatable {
    public static func == (lhs: EventOputput, rhs: EventOputput) -> Bool {
      return lhs.name == rhs.name
        && lhs.categoriesId == rhs.categoriesId
        && lhs.conversationsId == rhs.conversationsId
        && lhs.ownerId == rhs.ownerId
        && lhs.duration == rhs.duration
        && lhs.addressName == rhs.addressName
    }
}
