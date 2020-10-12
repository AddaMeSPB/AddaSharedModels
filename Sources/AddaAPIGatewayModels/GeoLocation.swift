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

final class GeoLocation: Model {
    static var schema = "geo_locations"

    init() {}
    
    init(id: ObjectId? = nil, addressName: String, coordinates: [Double], geoType: GeoType, eventID: Event.IDValue) {
        self.id = id
        self.addressName = addressName
        self.coordinates = coordinates
        self.geoType = geoType
        self.$event.id = eventID
    }
    
    @ID(custom: "id") var id: ObjectId?
    @Field(key: "addressName") var addressName: String
    @Field(key: "type") var geoType: GeoType
    @Field(key: "coordinates") var coordinates: [Double]
    @Parent(key: "eventId") var event: Event

    @Timestamp(key: "created_at", on: .create) var createdAt: Date?
    @Timestamp(key: "updated_at", on: .update) var updatedAt: Date?
    @Timestamp(key: "deleted_at", on: .delete) var deletedAt: Date?

}

extension GeoLocation: Content {}

enum GeoType: String {
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
