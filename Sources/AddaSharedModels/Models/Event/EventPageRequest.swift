
public struct EventPageRequest: Decodable {
    
    public var page: Int = 1
    public var par: Int = 10
    public var lat: Double = 59.93572512685927
    public var long: Double = 30.32722285814234
    public var distance: Double = 300000.0
    
    enum CodingKeys: String, CodingKey {
        case page = "page"
        case par = "par"
        case lat = "lat"
        case long = "long"
        case distance = "distance"
    }

    /// `Decodable` conformance.
    public init(from decoder: Decoder) throws {
        let container = try decoder.container(keyedBy: CodingKeys.self)
        self.page = try container.decodeIfPresent(Int.self, forKey: .page) ?? 1
        self.par = try container.decodeIfPresent(Int.self, forKey: .par) ?? 10
        self.lat = try container.decodeIfPresent(Double.self, forKey: .lat) ?? 59.93572512685927
        self.long = try container.decodeIfPresent(Double.self, forKey: .long) ?? 30.32722285814234
        self.distance = try container.decodeIfPresent(Double.self, forKey: .distance) ?? 300000.0
    }
    
    public init(
        page: Int = 1,
        par: Int = 10,
        lat: Double  = 59.93572512685927,
        long: Double = 30.32722285814234,
        distance: Double = 300000.0
    ) {
        self.page = page
        self.par = par
        self.lat = lat
        self.long = long
        self.distance = distance
    }
    
    var start: Int {
        (self.page - 1) * self.par
    }
    
    var end: Int {
        self.page * self.par
    }
}

extension EventPageRequest: Equatable {}
