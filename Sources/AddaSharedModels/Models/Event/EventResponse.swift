
import Foundation
import BSON

public struct EventResponse: Codable, Identifiable {

    public var id: ObjectId
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
    public var url: URL

    public var createdAt, updatedAt, deletedAt: Date?
    
    public var recreateEventWithSwapCoordinatesForMongoDB: EventResponse {
        .init(
            id: id,
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
            url: url,
            createdAt: createdAt,
            updatedAt: updatedAt,
            deletedAt: deletedAt
        )
    }
    
    public init(
        id: ObjectId,
        name: String,
        details: String? = nil,
        imageUrl: String? = nil,
        duration: Int, distance: Double? = nil,
        isActive: Bool,
        conversationsId: ObjectId,
        categoriesId: ObjectId,
        ownerId: ObjectId,
        addressName: String,
        sponsored: Bool? = nil,
        overlay: Bool? = nil,
        type: GeoType,
        coordinates: [Double],
        url: URL,
        createdAt: Date?, updatedAt: Date?, deletedAt: Date?
    ) {
        self.id = id
        self.name = name
        self.details = details
        self.imageUrl = imageUrl
        self.duration = duration
        self.distance = distance
        self.isActive = isActive
        self.conversationsId = conversationsId
        self.categoriesId = categoriesId
        self.ownerId = ownerId
        self.addressName = addressName
        self.sponsored = sponsored
        self.overlay = overlay
        self.type = type
        self.coordinates = coordinates
        self.url = url
        
        self.updatedAt = updatedAt
        self.createdAt = createdAt
        self.deletedAt = deletedAt
        
    }
    
    public func swapCoordinatesForMongoDB() -> [Double] {
        return [coordinates[1], coordinates[0]]
    }

}

extension EventResponse: Equatable {
    public static func == (lhs: EventResponse, rhs: EventResponse) -> Bool {
      return lhs.name == rhs.name
        && lhs.categoriesId == rhs.categoriesId
        && lhs.conversationsId == rhs.conversationsId
        && lhs.ownerId == rhs.ownerId
        && lhs.duration == rhs.duration
        && lhs.addressName == rhs.addressName
    }
}
