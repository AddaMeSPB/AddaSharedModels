//
//  EventPlaces.swift
//  
//
//  Created by Saroar Khandoker on 12.10.2020.
//

import Foundation
import Vapor
import Fluent
import FluentMongoDriver

public final class EventPlace: Model, Content {
  public static var schema = "event_places"
  
  public init() {}
  
  public init(
    id: ObjectId? = nil,
    addressName: String,
    geoType: GeoType,
    coordinates: [Double],
    image: String?,
    details: String? = nil,
    sponsored: Bool? = false,
    overlay: Bool? = false,
    eventID: Event.IDValue
  ) {
    self.id = id
    self.addressName = addressName
    self.coordinates = coordinates
    self.type = geoType
    self.image = image
    self.details = details
    self.sponsored = sponsored
    self.overlay = overlay
    self.$event.id = eventID
  }
  
  @ID(custom: "id") public var id: ObjectId?
  @Field(key: "addressName") public var addressName: String
  @Field(key: "type") public var type: GeoType
  @Field(key: "coordinates") public var coordinates: [Double]
  @Field(key: "image") public var image: String?
  @Field(key: "details") public var details: String?
  @Field(key: "sponsored") public var sponsored: Bool?
  @Field(key: "overlay") public var overlay: Bool?
  
  @Parent(key: "eventId") public var event: Event
  
  @Timestamp(key: "createdAt", on: .create) public var createdAt: Date?
  @Timestamp(key: "updatedAt", on: .update) public var updatedAt: Date?
  @Timestamp(key: "deletedAt", on: .delete) public var deletedAt: Date?
  
}

extension EventPlace {
  
  public struct Create: Content {
    public var eventId: ObjectId
    public var addressName: String
    public var image: String?
    public var details: String?
    public var sponsored: Bool?
    public var overlay: Bool?
    public var type: GeoType
    public var coordinates: [Double]
    
    public func swapCoordinatesForMongoDB() -> [Double] {
      return [coordinates[1], coordinates[0]]
    }
  }
  
  public var response: Item {
    .init(self)
  }
  
  public struct Item: Content {
    internal init(_ eventPlace: EventPlace) {
      self.id = eventPlace.id
      self.eventId = eventPlace.$event.id
      self.addressName = eventPlace.addressName
      self.type = eventPlace.type
      // when send coordinate from server it [long, lat] as mongoDB requre
      // when send back to ios send back ios formate [lat, long]
      self.coordinates = [eventPlace.coordinates[1], eventPlace.coordinates[0]]
      self.updatedAt = eventPlace.updatedAt
      self.createdAt = eventPlace.createdAt
      self.deletedAt = eventPlace.deletedAt
    }
    
    public var id: ObjectId?
    public var eventId: ObjectId
    public var addressName: String
    public var image: String?
    public var details: String?
    public var sponsored: Bool?
    public var overlay: Bool?
    public var type: GeoType
    public var coordinates: [Double]
    
    public var updatedAt, createdAt, deletedAt: Date?
  }
}

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
