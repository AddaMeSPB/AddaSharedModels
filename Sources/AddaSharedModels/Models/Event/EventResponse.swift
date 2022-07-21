
import Foundation
import MongoKitten
import MapKit

public struct EventInput {
    public var id: ObjectId?
    public var name: String
    public var details: String?
    public var imageUrl: String?
    public var duration: Int
    public var isActive: Bool
    public var ownerId: ObjectId?
    public var categoriesId: ObjectId
    public var conversationsId: ObjectId
    
    // Place Information
    public var addressName: String
    public var sponsored: Bool?
    public var overlay: Bool?
    public var type: GeoType
    public var coordinates: [Double]
    
    public init(
        id: ObjectId? = nil,
        name: String,
        details: String? = nil,
        imageUrl: String? = nil,
        duration: Int,
        isActive: Bool,
        ownerId: ObjectId?,
        conversationsId: ObjectId,
        categoriesId: ObjectId,
        addressName: String,
        sponsored: Bool? = nil,
        overlay: Bool? = nil,
        type: GeoType,
        coordinates: [Double]
    ) {
        self.name = name
        self.details = details
        self.imageUrl = imageUrl
        self.duration = duration
        self.isActive = isActive
        self.ownerId = ownerId
        self.conversationsId = conversationsId
        self.categoriesId = categoriesId
        self.addressName = addressName
        self.sponsored = sponsored
        self.overlay = overlay
        self.type = type
        self.coordinates = coordinates
    }
}

extension EventInput {
    public static var empty: EventInput = .init(name: "", duration: 0, isActive: false, ownerId: nil, conversationsId: ObjectId(), categoriesId: ObjectId(), addressName: "", type: .Polygon, coordinates: [0.0,0.0])
}

extension EventInput: Codable {}
extension EventInput: Equatable {}

public struct EventResponse: Codable, Identifiable {
    public var id: String? { _id?.hexString }
    
    public var _id: ObjectId?
    public var name: String
    public var details: String?
    public var imageUrl: String?
    public var duration: Int
    public let distance: Double?
    public var isActive: Bool
    public var categoriesId: ObjectId
    public var conversationsId: ObjectId
    
    // Place Information
    public var addressName: String
    public var sponsored: Bool?
    public var overlay: Bool?
    public var type: GeoType
    public var coordinates: [Double]
    public var regionRadius: CLLocationDistance? = 1000
    public var url: URL
    
    public var updatedAt, createdAt, deletedAt: Date?
    
    public var recreateEventWithSwapCoordinatesForMongoDB: EventResponse {
        .init(
            id: _id, name: name, details: details, imageUrl: imageUrl,
            duration: duration, distance: distance, isActive: isActive,
            conversationsId: conversationsId, categoriesId: categoriesId,
            addressName: addressName, sponsored: sponsored, overlay: overlay,
            type: type, coordinates: swapCoordinatesForMongoDB(), createdAt: createdAt,
            updatedAt: updatedAt, deletedAt: deletedAt, url: url
        )
    }
    
    public init(
        id: ObjectId? = nil,
        name: String,
        details: String? = nil,
        imageUrl: String? = nil,
        duration: Int, distance: Double? = nil,
        isActive: Bool,
        conversationsId: ObjectId,
        categoriesId: ObjectId,
        addressName: String,
        sponsored: Bool? = nil,
        overlay: Bool? = nil,
        type: GeoType,
        coordinates: [Double],
        createdAt: Date?, updatedAt: Date?, deletedAt: Date?,
        url: URL
    ) {
        self._id = id
        self.name = name
        self.details = details
        self.imageUrl = imageUrl
        self.duration = duration
        self.distance = distance
        self.isActive = isActive
        self.conversationsId = conversationsId
        self.categoriesId = categoriesId
        self.addressName = addressName
        self.sponsored = sponsored
        self.overlay = overlay
        self.type = type
        self.coordinates = coordinates
        self.updatedAt = updatedAt
        self.createdAt = createdAt
        self.deletedAt = deletedAt
        
        self.url = url
    }
    
    
    public func swapCoordinatesForMongoDB() -> [Double] {
        return [coordinates[1], coordinates[0]]
    }
}

extension EventResponse: Equatable {
    public static func == (lhs: EventResponse, rhs: EventResponse) -> Bool {
      return lhs.name == rhs.name
        && lhs.categoriesId == rhs.categoriesId
        && lhs.categoriesId == rhs.conversationsId
        && lhs.duration == rhs.duration
        && lhs.addressName == rhs.addressName
    }
}
