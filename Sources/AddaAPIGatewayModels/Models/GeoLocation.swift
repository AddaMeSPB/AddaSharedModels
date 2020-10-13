//
//  GeoLocation.swift
//  
//
//  Created by Saroar Khandoker on 12.10.2020.
//

import Foundation
import Vapor
import Fluent
import FluentMongoDriver

public final class GeoLocation: Model {
    public static var schema = "geo_locations"

    public init() {}
    
    public init(id: ObjectId? = nil, addressName: String, coordinates: [Double], geoType: GeoType, eventID: Event.IDValue) {
        self.id = id
        self.addressName = addressName
        self.coordinates = coordinates
        self.geoType = geoType
        self.$event.id = eventID
    }
    
    @ID(custom: "id") public var id: ObjectId?
    @Field(key: "addressName") public var addressName: String
    @Field(key: "type") public var geoType: GeoType
    @Field(key: "coordinates") public var coordinates: [Double]
    @Parent(key: "eventId") public var event: Event

    @Timestamp(key: "created_at", on: .create) public var createdAt: Date?
    @Timestamp(key: "updated_at", on: .update) public var updatedAt: Date?
    @Timestamp(key: "deleted_at", on: .delete) public var deletedAt: Date?

}

extension GeoLocation: Content {}

public enum GeoType: String {
    case Point
    case LineString
    case Polygon
    case MultiPoint
    case MultiLineString
    case MultiPolygon
    case GeometryCollection
}

extension GeoType: Encodable {}
extension GeoType: Decodable {}
