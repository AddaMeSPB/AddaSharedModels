//
//  Event.swift
//  
//
//  Created by Saroar Khandoker on 12.10.2020.
//

import Foundation
import Vapor
import Fluent
import FluentMongoDriver

public final class Event: Model, Content {
  public static var schema = "events"
  
  public init() {}
  
  public init(
    id: ObjectId? = nil, name: String, details: String? = nil,
    imageUrl: String? = nil, duration: Int, categories: String,
    isActive: Bool, addressName: String,
    geoType: GeoType, coordinates: [Double],
    sponsored: Bool? = false, overlay: Bool? = false,
    ownerId: User.IDValue, conversationsId: Conversation.IDValue
  ) {
    self.id = id
    self.name = name
    self.details = details
    self.imageUrl = imageUrl
    self.duration = duration
    self.categories = categories
    self.isActive = isActive
    
    // Place information
    self.addressName = addressName
    self.type = geoType
    self.coordinates = coordinates
    self.sponsored = sponsored
    self.overlay = overlay
    
    self.$owner.id = ownerId
    self.$conversation.id = conversationsId
  }
  
  public init(content: CUEvent, ownerID: ObjectId, conversationsID: ObjectId) {
    self.name = content.name
    self.details = content.details
    self.imageUrl = content.imageUrl
    self.duration = content.duration
    self.categories = content.categories
    self.isActive = content.isActive
    
    // Place information
    self.addressName = content.addressName
    self.type = content.type
    self.coordinates = content.coordinates
    self.sponsored = content.sponsored
    self.overlay = content.overlay
    
    self.$owner.id = ownerID
    self.$conversation.id = conversationsID

  }
  
  @ID(custom: "id") public var id: ObjectId?
  @Field(key: "name") public var name: String
  @OptionalField(key: "details") public var details: String?
  @OptionalField(key: "imageUrl") public var imageUrl: String?
  @Field(key: "duration") public var duration: Int
  @Field(key: "categories") public var categories: String
  @Field(key: "isActive") public var isActive: Bool
  
  // Place information
  @Field(key: "addressName") public var addressName: String
  @Field(key: "type") public var type: GeoType
  @Field(key: "coordinates") public var coordinates: [Double]
  @OptionalField(key: "sponsored") public var sponsored: Bool?
  @OptionalField(key: "overlay") public var overlay: Bool?

  @Parent(key: "ownerId") public var owner: User
  @Parent(key: "conversationsId") public var conversation: Conversation
  
  @Timestamp(key: "createdAt", on: .create) public var createdAt: Date?
  @Timestamp(key: "updatedAt", on: .update) public var updatedAt: Date?
  @Timestamp(key: "deletedAt", on: .delete) public var deletedAt: Date?
  
}

extension Event {
  
  public var response: Item {
    .init(self)
  }
  
  public struct Item: Content {
    public init(_id: ObjectId? = nil, name: String, details: String? = nil, imageUrl: String? = nil, duration: Int, isActive: Bool, conversationsId: ObjectId, categories: String, addressName: String, sponsored: Bool? = nil, overlay: Bool? = nil, type: GeoType, coordinates: [Double], updatedAt: Date?, createdAt: Date?, deletedAt: Date?) {
      self._id = _id
      self.name = name
      self.details = details
      self.imageUrl = imageUrl
      self.duration = duration
      self.isActive = isActive
      self.conversationsId = conversationsId
      self.categories = categories
      self.addressName = addressName
      self.sponsored = sponsored
      self.overlay = overlay
      self.type = type
      self.coordinates = coordinates
      self.updatedAt = updatedAt
      self.createdAt = createdAt
      self.deletedAt = deletedAt
    }
    
    public var recreateEventWithSwapCoordinatesForMongoDB: Event.Item {
      .init(_id: _id, name: name, details: details, imageUrl: imageUrl, duration: duration, isActive: isActive, conversationsId: conversationsId, categories: categories, addressName: addressName, sponsored: sponsored, overlay: overlay, type: type, coordinates: swapCoordinatesForMongoDB(), updatedAt: updatedAt, createdAt: createdAt, deletedAt: deletedAt)
    }
    
    public init(_ event: Event) {
      self._id = event.id
      self.name = event.name
      self.details = event.details
      self.imageUrl = event.imageUrl
      self.duration = event.duration
      self.categories = event.categories
      self.isActive = event.isActive
      self.conversationsId = event.$conversation.id
      
      // Place information
      self.addressName = event.addressName
      self.type = event.type
      self.coordinates = event.coordinates
      self.sponsored = event.sponsored
      self.overlay = event.overlay
      
      //db.events.updateMany({}, [{ $set: { addressName: "", details: "if you want you explain about your event" type: "Point", coordinates: [29.873706166262373, 60.26134045287572], sponsored: false, overlay: false } }])
            
      self.createdAt = event.createdAt
      self.updatedAt = event.updatedAt
      self.deletedAt = event.deletedAt
    }
    
    public var _id: ObjectId?
    public var name: String
    public var details: String?
    public var imageUrl: String?
    public var duration: Int
    public var isActive: Bool
    public var categories: String
    public var conversationsId: ObjectId
    
    // Place Information
    public var addressName: String
    public var sponsored: Bool?
    public var overlay: Bool?
    public var type: GeoType
    public var coordinates: [Double]
    
    public let updatedAt, createdAt, deletedAt: Date?
    
    public func swapCoordinatesForMongoDB() -> [Double] {
      return [coordinates[1], coordinates[0]]
    }
  }
  
 
}


public struct EventPage: Content {
    /// The page's items. Usually models.
  public let items: [Event.Item]

    /// Metadata containing information about current page, items per page, and total items.
    public let metadata: PageMetadata

    /// Creates a new `Page`.
    public init(items: [Event.Item], metadata: PageMetadata) {
        self.items = items
        self.metadata = metadata
    }
}

public struct EventPageRequest: Decodable {

    public let page: Int
    public let per: Int
    public let lat: Double
    public let long: Double
    public let distance: Int

    enum CodingKeys: String, CodingKey {
        case page = "page"
        case per = "per"
        case lat = "lat"
        case long = "long"
        case distance = "distance"
    }

    /// `Decodable` conformance.
    public init(from decoder: Decoder) throws {
        let container = try decoder.container(keyedBy: CodingKeys.self)
        self.page = try container.decodeIfPresent(Int.self, forKey: .page) ?? 1
        self.per = try container.decodeIfPresent(Int.self, forKey: .per) ?? 10
        self.lat = try container.decodeIfPresent(Double.self, forKey: .lat) ?? 59.9311
        self.long = try container.decodeIfPresent(Double.self, forKey: .long) ?? 30.3609
        self.distance = try container.decodeIfPresent(Int.self, forKey: .distance) ?? 250
    }

    public init(page: Int, per: Int, lat: Double, long: Double, distance: Int) {
        self.page = page
        self.per = per
        self.lat = lat
        self.long = long
        self.distance = distance
    }

    var start: Int {
        (self.page - 1) * self.per
    }

    var end: Int {
        self.page * self.per
    }
}

public struct CUEvent: Content {
  public var name: String
  public var details: String?
  public var imageUrl: String?
  public var duration: Int
  public var categories: String
  public var isActive: Bool
  
  public var addressName: String
  public var type: GeoType
  public var coordinates: [Double]
  public var sponsored: Bool?
  public var overlay: Bool?
  
  public var ownerId: ObjectId?
  public var conversationsId: ObjectId?
}

