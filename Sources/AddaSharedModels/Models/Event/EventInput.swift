
import Foundation
import BSON

public struct EventInput {
    public var name: String
    public var details: String?
    public var imageUrl: String?
    public var duration: Int
    public var isActive: Bool
    public var ownerId: ObjectId?
    public var conversationsId: ObjectId?
    public var categoriesId: ObjectId
    
    // Place Information
    public var addressName: String
    public var sponsored: Bool?
    public var overlay: Bool?
    public var type: GeoType
    public var coordinates: [Double]
    
    public init(
        name: String,
        details: String? = nil,
        imageUrl: String? = nil,
        duration: Int,
        isActive: Bool,
        ownerId: ObjectId? = nil,
        conversationsId: ObjectId? = nil,
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
