
import Foundation
import MongoKitten

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
